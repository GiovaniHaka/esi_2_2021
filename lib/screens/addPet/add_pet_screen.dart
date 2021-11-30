import 'package:esi_2_2021/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_pet_controller.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);
  
  static const swithCatDog = Key('swithCatDog');

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  final _formSignInKey = GlobalKey<FormState>();

  bool isDog = true;
  String petName = '';
  String dropdownDog = 'Rotweiller';
  String dropdownCat = 'Persa';
  String specie = '';

  List<DropdownMenuItem<String>>? dogsSpecies = [
    'Rotweiller',
    'Golden Retriever',
    'Maltês',
    'Dalmata'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  List<DropdownMenuItem<String>>? catsSpecies = [
    'Persa',
    'British Shorthair',
    'Maine Coon',
    'Bengal'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

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
              Text('Tipo do pet:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: isDog,
                    onChanged: (value) {
                      setState(() {
                        isDog = value;
                        print(isDog);
                      });
                    },
                  ),
                  Text('Cachorro'),
                  Switch(
                    value: !isDog,
                    onChanged: (value) {
                      setState(() {
                        isDog = !value;
                        print(isDog);
                      });
                    },
                  ),
                  Text('Gato'),
                ],
              ),
              SizedBox(height: 30),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                ),
                onChanged: (val) {
                  setState(() => petName = val);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) return 'Insira um nome!';
                  return null;
                },
              ),
              SizedBox(height: 30),
              Text('Espécie:'),
              DropdownButton<String>(
                value: isDog ? dropdownDog : dropdownCat,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 24,
                isExpanded: true,
                elevation: 20,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.blue,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    isDog ? dropdownDog = newValue! : dropdownCat = newValue!;
                    specie = newValue;
                  });
                },
                items: isDog ? dogsSpecies : catsSpecies,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  isDog ? specie = dropdownDog : specie = dropdownCat;
                  AddPetController().addPet(specie, petName, isDog);
                  Get.offAll(HomeScreen());
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
