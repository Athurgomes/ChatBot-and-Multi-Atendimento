import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedType = 'Pessoa Física'; // Default type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 17, 0, 115), // Azul escuro
                  Color.fromARGB(255, 0, 42, 50), // Verde água vibrante
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80), // Espaçamento acima da logo

                      // Logo
                      Image.asset(
                        'assets/logo.png', // Coloque o caminho correto da sua logo
                        height: 100, // Tamanho da logo
                      ),

                      const SizedBox(height: 50), // Espaçamento abaixo da logo

                      // Card com o formulário de cadastro
                      SizedBox(
                        width: 600,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 24.0, horizontal: 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 16),

                                // Título "Cadastre-se agora"
                                const Text(
                                  'Cadastre-se agora',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Dropdown + CPF/CNPJ
                                Row(
                                  children: [
                                    // Dropdown para selecionar tipo de cadastro
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        decoration: InputDecoration(
                                          labelText: 'Tipo de Cadastro',
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        value: selectedType,
                                        items: const [
                                          DropdownMenuItem(
                                            value: 'Pessoa Física',
                                            child: Text('Pessoa Física'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Pessoa Jurídica',
                                            child: Text('Pessoa Jurídica'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedType = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    // Campo CPF ou CNPJ
                                    Expanded(
                                      child: TextField(
                                        controller:
                                            selectedType == 'Pessoa Física'
                                                ? cpfController
                                                : cnpjController,
                                        decoration: InputDecoration(
                                          labelText:
                                              selectedType == 'Pessoa Física'
                                                  ? 'CPF'
                                                  : 'CNPJ',
                                          prefixIcon: const Icon(
                                            Icons.credit_card,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Nome + Sobrenome
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: firstNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Primeiro Nome',
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextField(
                                        controller: lastNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Sobrenome',
                                          prefixIcon: const Icon(
                                            Icons.person_outline,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Email + WhatsApp
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          labelText: 'E-mail',
                                          prefixIcon: const Icon(
                                            Icons.email,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextField(
                                        controller: whatsappController,
                                        decoration: InputDecoration(
                                          labelText: 'WhatsApp',
                                          prefixIcon: const Icon(
                                            Icons.phone,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Senha + Confirmar Senha
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Senha',
                                          prefixIcon: const Icon(
                                            Icons.lock,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextField(
                                        controller: confirmPasswordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          labelText: 'Confirmar Senha',
                                          prefixIcon: const Icon(
                                            Icons.lock_outline,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 24),

                                // Botão de Cadastro
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 17, 0, 115),
                                    minimumSize:
                                        const Size(double.infinity, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Link para login
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Já possui uma conta? Faça login',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
