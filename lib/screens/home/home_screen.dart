import 'package:esi_2_2021/models/pet.dart';
import 'package:esi_2_2021/screens/addPet/add_pet_screen.dart';
import 'package:esi_2_2021/screens/home/components/pet_card.dart';
import 'package:esi_2_2021/screens/home/home_screen_controller.dart';
import 'package:esi_2_2021/screens/petDetails/pet_details_screen.dart';
import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:esi_2_2021/services/database/pet.dart';
import 'package:esi_2_2021/services/url_launch/url_whatsapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pety'),
        centerTitle: true,
        actions: [
          CupertinoButton(
            child: Text(
              'Sair',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => AuthService().signOut(),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text('Bem vindo ao pety!'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () => Get.to(AddPetScreen()),
              child: Text('Adicionar Pet!'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () => UrlLaunch.callSupport(),
              child: Text('Ligar para suporte!'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async => await UrlLaunch.openWhatsApp(),
              child: Text('Mandar mensagem para suporte!'),
            ),
            FutureBuilder(
              future: HomeController.getActivePets(),
              builder: (context, AsyncSnapshot<List<Pet>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.connectionState == ConnectionState.none) {
                  return Text('Connection none');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Pet> pets = snapshot.data!;
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
                          return GestureDetector(
                            onTap: () =>
                                Get.to(PetDetailsScreen(pet: pets[index])),
                            child: PetCard(pet: pets[index]),
                          );
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
