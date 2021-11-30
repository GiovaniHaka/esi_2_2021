// Import the test package and Counter class
import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/screens/home/home_screen_controller.dart';
import 'package:test/test.dart';

void main() {
  test('Should format petObjects', () {
    List<Map<String, dynamic>> petObjects = [
      {
        "petName": "Max",
        "specie": "Labrador",
        "isDog": true,
        "id": "12345",
      }
    ];
    expect(HomeController.formatTodoObjects(petObjects),
        [Pet(petName: "Max", specie: "Labrador", isDog: true, id: "12345")]);
  });
}
