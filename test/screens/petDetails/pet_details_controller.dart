// Import the test package and Counter class
import 'package:esi_2_2021/models/vaccine.dart';
import 'package:esi_2_2021/screens/petDetails/pet_details_controller.dart';
import 'package:test/test.dart';

void main() {
  test('Should format vaccineObjects', () {
    DateTime createdAt = DateTime.now();
    print(createdAt);
    List<Map<String, dynamic>> vaccineObjects = [
      {
        'id': 'id',
        'vaccine': 'V10',
        'createdAt': createdAt.toString(),
      }
    ];
    expect(PetDetailsController.formatVaccineObjects(vaccineObjects),
        [Vaccine(id: 'id', vaccine: 'V10', createdAt: createdAt)]);
  });
}
