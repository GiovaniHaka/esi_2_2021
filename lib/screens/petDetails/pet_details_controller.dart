import 'package:esi_2_2021/helpers/logging.dart';
import 'package:esi_2_2021/models/vaccine.dart';
import 'package:esi_2_2021/services/database/vaccine.dart';

class PetDetailsController {
  static List<Vaccine> formatVaccineObjects(todoObjects) {
    List<Vaccine> pets = [];
    if (todoObjects != null) {
      todoObjects.forEach((todo) {
        pets.add(Vaccine.fromMap(todo));
      });
      pets.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }
    return pets;
  }

  static Future<List<Vaccine>> getVaccines(String petId) async {
    logger(PetDetailsController).i('getting todoList');
    final todoObjects = await VaccineRepository.getVaccines(petId);
    var todos = formatVaccineObjects(todoObjects);
    logger(PetDetailsController).v(todos);
    return todos;
  }
}
