import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';

// ignore: unused_import
import 'Screens/recoverypassword_screen/recovery_password_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

void main() {
  runApp(const MyApp());
}