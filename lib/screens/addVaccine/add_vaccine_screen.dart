import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/screens/addVaccine/add_vaccine_controller.dart';
import 'package:esi_2_2021/screens/petDetails/pet_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddVaccineScreen extends StatefulWidget {
  final Pet pet;
  const AddVaccineScreen({Key? key, required this.pet}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddVaccineScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  String vaccine = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Pet'),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formSignInKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Vacina',
                ),
                onChanged: (val) {
                  setState(() => vaccine = val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Insira um nome!';
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  AddVaccineController()
                      .addVaccine(this.widget.pet.id, vaccine);
                  Get.back();
                },
                child: Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
