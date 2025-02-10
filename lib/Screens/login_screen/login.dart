import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart';
import 'package:chatbot_multiatendimento/Screens/recoverypassword_screen/recovery_password_screen.dart';
import 'package:chatbot_multiatendimento/Screens/homepage/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF110073), // Azul escuro
              Color(0xFF002A32), // Verde água vibrante
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: _opacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Hero(
                          tag: 'logo',
                          child: Image.asset(
                            'assets/logo.png',
                            height: constraints.maxWidth > 600 ? 120 : 100,
                          ),
                        ),
                        const SizedBox(height: 50),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: constraints.maxWidth > 600
                              ? 400
                              : double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Bem-vindo!',
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RecoveryPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Esqueceu a senha?',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    Future.delayed(const Duration(seconds: 2),
                                        () {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.push(
                                        // ignore: use_build_context_synchronously
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardPage(),
                                        ),
                                      );
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF001C70),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: _isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white)
                                      : const Text(
                                          'Entrar',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Não tem uma conta? Registre-se agora',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
