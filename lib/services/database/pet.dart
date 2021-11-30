import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esi_2_2021/helpers/logging.dart';
import 'package:esi_2_2021/models/pet.dart';

class PetRepository {
  static CollectionReference todos =
      FirebaseFirestore.instance.collection('pets');

  static Future<void> insertPet(Pet pet) {
    logger(PetRepository).v(pet);
    return todos
        .doc(pet.id)
        .set({
          'isDog': pet.isDog,
          'petName': pet.petName,
          'specie': pet.specie,
        })
        .then(
          (value) => logger(PetRepository).i("todo added"),
        )
        .catchError(
          (error) => logger(PetRepository).e("Failed to add pet: $error"),
        );
  }

  static Future<List<Map<String, dynamic>>> getPets() async {
    List<Map<String, dynamic>> _pets = [];
    await FirebaseFirestore.instance
        .collection('pets')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> docToMap = {
          'isDog': doc['isDog'],
          'petName': doc['petName'],
          'specie': doc['specie'],
          'id': doc.id,
        };
        _pets.add(docToMap);
      });
      logger(PetRepository).v(_pets);
    });
    return _pets;
  }

  static Future<void> deletePet(String documentId) {
    return todos
        .doc(documentId)
        .delete()
        .then((value) => print("Pet $documentId Deleted"))
        .catchError((error) => print("Failed to delete pet: $error"));
  }
}
