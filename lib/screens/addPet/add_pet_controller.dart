import 'dart:math';

import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/services/database/pet.dart';

class AddPetController {
  void addPet(
    String specie,
    String petName,
    bool isDog,
  ) {
    var pet = Pet(
      petName: petName,
      specie: specie,
      isDog: isDog,
      id: Random().nextInt(1000000).toString(),
    );
    PetRepository.insertPet(pet);
    print(pet);
  }
}
