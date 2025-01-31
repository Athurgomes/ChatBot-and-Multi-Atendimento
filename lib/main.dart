import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';
import 'package:chatbot_multiatendimento/Screens/homepage/home.dart'; // Importe a HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(), // Defina a tela inicial como LoginScreen
    );
  }
}