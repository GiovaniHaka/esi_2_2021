import 'package:flutter/material.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({Key? key}) : super(key: key);

  @override
  _AddPetScreenState createState() => _AddPetScreenState();
}

class _AddPetScreenState extends State<AddPetScreen> {
  String _selectedDogSpecies = 'Akita';
  String _selectedCatSpecies = 'Persa';
  bool _isDog = true;

  List<DropdownMenuItem<String>> _dogSpecies = <String>[
    'Akita',
    'Beagle',
    'Chihuahua',
    'Doberman',
    'Pinscher',
    'Poodle',
    'Pug',
    'Yorkshire'
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  List<DropdownMenuItem<String>> _catSpecies = <String>[
    'Persa',
    'Siamês',
    'Angorá',
    'Sphynx',
    'Ragdoll',
    'Ashera',
    'Exótico'
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: _isDog,
                      onChanged: (bool? value) {
                        setState(() {
                          _isDog = !_isDog;
                        });
                      },
                    ),
                    Text('Cachorro')
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: !_isDog,
                      onChanged: (bool? value) {
                        setState(() {
                          _isDog = !_isDog;
                        });
                      },
                    ),
                    Text('Gato')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              value: _isDog ? _selectedDogSpecies : _selectedCatSpecies,
              isExpanded: true,
              style: TextStyle(color: Theme.of(context).primaryColor),
              underline: Container(
                height: 2,
                color: Theme.of(context).primaryColor,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  if (_isDog) _selectedDogSpecies = newValue!;
                  if (!_isDog) _selectedCatSpecies = newValue!;
                });
              },
              items: _isDog ? _dogSpecies : _catSpecies,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome do animal *:'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            )
          ],
        ),
      ),
    );
  }
}
