import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart'; // Tela de Login
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart'; // Tela de Cadastro

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Define a tela inicial para login
      routes: {
        '/login': (context) => LoginScreen(), // Rota para a tela de login
        '/cadastro': (context) =>
            SignUpScreen(), // Rota para a tela de cadastro
      },
    );
  }
}
