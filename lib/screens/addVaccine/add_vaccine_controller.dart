import 'dart:math';

import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/models/vaccine.dart';
import 'package:esi_2_2021/services/database/pet.dart';
import 'package:esi_2_2021/services/database/vaccine.dart';

class AddVaccineController {
  void addVaccine(
    String petId,
    String vaccine,
  ) {
    var vaccineToAdd = Vaccine(
      vaccine: vaccine,
      createdAt: DateTime.now(),
      id: Random().nextInt(1000000).toString(),
    );
    VaccineRepository.insertVaccine(petId, vaccineToAdd);
    print(vaccineToAdd);
  }
}
