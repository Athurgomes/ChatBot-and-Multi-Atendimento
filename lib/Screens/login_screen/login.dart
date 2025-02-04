import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart';
import 'package:chatbot_multiatendimento/Screens/recoverypassword_screen/recovery_password_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF001C70), // Azul escuro
              Color(0xFF0F96BB), // Verde água vibrante
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80), // Espaçamento acima da logo

                  // Logo
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),

                  const SizedBox(height: 50), // Espaçamento abaixo da logo

                  // Caixa de login
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      maxWidth: 500, // Largura máxima
                      minHeight: 300, // Altura mínima
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Título
                          const Text(
                            'Bem-vindo!',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          // Campo de Email
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Campo de Senha
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Colors.black54),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Esqueci a senha
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Lógica para recuperação de senha
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecoveryPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Esqueceu a senha?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                              height: 35), // Espaçamento antes do botão

                          // Botão de login
                          SizedBox(
                            width: double.infinity,
                            height: 55.0, // Tamanho maior para o botão
                            child: ElevatedButton(
                              onPressed: () {
                                // Lógica de login
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF001C70), // Cor de fundo
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                textStyle: TextStyle(
                                  fontSize: 18, // Tamanho da fonte
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Registro de nova conta
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Não tem uma conta? Registre-se agora',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
