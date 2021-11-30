import 'package:esi_2_2021/helpers/logging.dart';
import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/services/database/pet.dart';

class HomeController {
  static List<Pet> formatTodoObjects(todoObjects) {
    List<Pet> pets = [];
    if (todoObjects != null) {
      todoObjects.forEach((todo) {
        pets.add(Pet.fromMap(todo));
      });
      pets.sort((a, b) => a.petName.compareTo(b.petName));
    }
    return pets;
  }

  static Future<List<Pet>> getActivePets() async {
    logger(HomeController).i('getting todoList');
    final todoObjects = await PetRepository.getPets();
    var todos = formatTodoObjects(todoObjects);
    logger(HomeController).v(todos);
    return todos;
  }
}
