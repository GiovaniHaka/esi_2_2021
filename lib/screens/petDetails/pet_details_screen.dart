import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/models/vaccine.dart';
import 'package:esi_2_2021/screens/addVaccine/add_vaccine_screen.dart';
import 'package:esi_2_2021/screens/home/components/pet_card.dart';
import 'package:esi_2_2021/screens/home/home_screen.dart';
import 'package:esi_2_2021/screens/petDetails/components/vaccine_card.dart';
import 'package:esi_2_2021/screens/petDetails/pet_details_controller.dart';
import 'package:esi_2_2021/services/database/pet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PetDetailsScreen extends StatefulWidget {
  final Pet pet;
  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  @override
  _PetDetailsScreenState createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              PetRepository.deletePet(widget.pet.id);
              Get.offAll(HomeScreen());
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PetCard(pet: widget.pet),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.to(AddVaccineScreen(pet: widget.pet)),
              child: Text('Adicionar Vacina!'),
            ),
            FutureBuilder(
              future: PetDetailsController.getVaccines(widget.pet.id),
              builder: (context, AsyncSnapshot<List<Vaccine>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.none) {
                  return Text('Connection none');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Vaccine> pets = snapshot.data!;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pets.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return VaccineCard(
                              pet: widget.pet, vaccine: pets[index]);
                        },
                      ),
                    );
                  }
                  return Text('Adicione um programa acima!');
                }
                return Text('Erro');
              },
            ),
          ],
        ),
      ),
    );
  }
}
