import 'package:firebase_core/firebase_core.dart';
import 'package:esi_2_2021/screens/wrapper.dart';
import 'package:esi_2_2021/services/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'models/firebaseUser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container();
    }
    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Container();
    }
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().currentUser,
      initialData: FirebaseUser(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme:
              AppBarTheme(iconTheme: IconThemeData(color: Colors.blue)),
          backgroundColor: Colors.white,
        ),
        home: Wrapper(),
      ),
    );
  }
}
