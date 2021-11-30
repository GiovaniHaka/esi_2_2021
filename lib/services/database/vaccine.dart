import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esi_2_2021/helpers/logging.dart';
import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/models/vaccine.dart';

class VaccineRepository {
  static Future<void> insertVaccine(String petId, Vaccine vaccine) {
    return FirebaseFirestore.instance
        .collection('pets/$petId/vaccines')
        .doc(vaccine.id)
        .set({
          'vaccine': vaccine.vaccine,
          'createdAt': DateTime.now(),
        })
        .then(
          (value) => logger(VaccineRepository).i("Vaccine added"),
        )
        .catchError(
          (error) =>
              logger(VaccineRepository).e("Failed to add Vaccine: $error"),
        );
  }

  static Future<List<Map<String, dynamic>>> getVaccines(String petId) async {
    List<Map<String, dynamic>> _vaccines = [];
    await FirebaseFirestore.instance
        .collection('pets/$petId/vaccines')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> docToMap = {
          'vaccine': doc['vaccine'],
          'createdAt': doc['createdAt'],
          'id': doc.id,
        };
        _vaccines.add(docToMap);
      });
      logger(VaccineRepository).v(_vaccines);
    });
    return _vaccines;
  }

  static Future<void> deleteVaccine(String petId, String documentId) {
    return FirebaseFirestore.instance
        .collection('pets/$petId/vaccines')
        .doc(documentId)
        .delete()
        .then((value) => print("Pet $documentId Deleted"))
        .catchError((error) => print("Failed to delete pet: $error"));
  }
}
