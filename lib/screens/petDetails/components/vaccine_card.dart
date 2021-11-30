import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/models/vaccine.dart';
import 'package:esi_2_2021/screens/petDetails/pet_details_screen.dart';
import 'package:esi_2_2021/services/database/vaccine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaccineCard extends StatelessWidget {
  final Pet pet;
  final Vaccine vaccine;
  const VaccineCard({Key? key, required this.vaccine, required this.pet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${vaccine.vaccine}",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${vaccine.createdAt}",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
              onPressed: () {
                VaccineRepository.deleteVaccine(pet.id, vaccine.id);
                Get.reload();
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
