import 'package:esi_2_2021/models/firebaseUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authentication/authenticate_screen.dart';
import 'home/home_screen.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<FirebaseUser?>(context);
    print('Provider: $firebaseUser');

    //Return HomeSccreen or AuthenticateScreen
    // if owner object on provider is null (not logged) return authenticate screen
    if (firebaseUser == null) {
      return AuthenticateScreen();
    }
    // timer.cancel();
    return HomeScreen();
  }
}
