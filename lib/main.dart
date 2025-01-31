import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';
// ignore: unused_import
import 'package:chatbot_multiatendimento/Screens/homepage/home.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), 
    );
  }
}