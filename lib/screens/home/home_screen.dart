import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:esi_2_2021/services/url_launch/url_whatsapp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () => UrlLaunch.callSupport(),
              child: Text('Ligar para suporte!'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async => await UrlLaunch.openWhatsApp(),
              child: Text('Mandar mensagem para suporte!'),
            ),
          ],
        ),
      ),
    );
  }
}
