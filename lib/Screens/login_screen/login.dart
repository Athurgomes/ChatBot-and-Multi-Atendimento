import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/registration_screen/cadastroUser.dart';
import 'package:chatbot_multiatendimento/Screens/recoverypassword_screen/recovery_password_screen.dart';
import 'package:chatbot_multiatendimento/Screens/dashboard/dashboard_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false; // Estado para indicar carregamento do botão "Entrar"
  double _opacity = 0.0; // Opacidade inicial da tela (efeito de fade-in)

  // Controladores para os campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Adiciona um pequeno delay antes de alterar a opacidade para criar um efeito de transição suave
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
        // Fundo com gradiente azul
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 26, 90, 153), // Azul escuro
              Color(0xFF004CFF), // Azul mais claro
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Define largura do container com base no tamanho da tela
                double containerWidth = constraints.maxWidth > 1200
                    ? 600
                    : constraints.maxWidth > 800
                        ? 500
                        : constraints.maxWidth * 0.75;

                // Define altura do container de acordo com a altura da tela
                double containerHeight = constraints.maxHeight > 1000
                    ? 600
                    : constraints.maxHeight > 800
                        ? 500
                        : constraints.maxHeight > 600
                            ? 450
                            : 380;

                return SingleChildScrollView(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: _opacity, // Aplica a animação de fade-in
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                            height: 50), // Espaço entre o topo da tela e a logo
                        // Exibe a logo da aplicação
                        Image.asset(
                          'assets/logo.png',
                          height: constraints.maxWidth > 600 ? 120 : 80,
                        ),
                        const SizedBox(
                            height: 40), // Aumentei o espaçamento após a logo

                        // Card branco onde ficam os campos de login
                        Container(
                          width: containerWidth,
                          height: containerHeight,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                5.0), // Borda arredondada do card
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10.0,
                                spreadRadius: 5.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Título da tela
                              Text(
                                'Bem-vindo',
                                style: GoogleFonts.robotoFlex(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      40), // Aumentei o espaçamento após o título

                              // Campo de email
                              TextField(
                                controller: _emailController,
                                style: GoogleFonts.robotoFlex(),
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      18), // Espaço entre os campos de entrada

                              // Campo de senha
                              TextField(
                                controller: _passwordController,
                                obscureText: true, // Oculta o texto digitado
                                decoration: const InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      18), // Aumentei o espaçamento entre os campos

                              // Link para recuperação de senha
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
                                  child: Text(
                                    'Esqueceu a senha?',
                                    style: GoogleFonts.robotoFlex(
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      45), // Aumentei o espaçamento antes do botão

                              // Botão de login
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  // Simula um carregamento antes de ir para a tela principal
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DashboardPage(),
                                      ),
                                    );
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                      0xFF004CFF), // Cor azul do botão
                                  minimumSize: const Size(double.infinity, 52),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Borda arredondada do botão
                                  ),
                                ),
                                child: _isLoading
                                    ? const CircularProgressIndicator(
                                        color: Colors
                                            .white) // Indicador de carregamento
                                    : Text(
                                        'Entrar',
                                        style: GoogleFonts.robotoFlex(
                                            fontSize: 16, color: Colors.white),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Espaçamento abaixo do card de login

                        // Link para criar uma conta nova
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Não tem uma conta? Registre-se agora',
                            style: GoogleFonts.robotoFlex(
                                color: Colors.white, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                            height: 20), // Espaço final antes do fim da tela
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
