import 'package:flutter/material.dart';
import 'package:ooze_shopper/screens/authenticate/login.dart';
import 'package:ooze_shopper/screens/home/home.dart';
import 'package:ooze_shopper/screens/profile/changePassword.dart';
import 'package:ooze_shopper/screens/profile/profileUpdate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
        '/Dashboard': (context) => const Home(),
        '/SignOut' : (context) => const Login(),
        '/Profile' : (context) =>  const ProfileUpdate(),
        '/Change Password' : (context) => const ChangePassword()
      },
    );
  }
}
