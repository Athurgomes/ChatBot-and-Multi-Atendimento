import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controladores para capturar os dados dos campos de entrada
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String selectedType = 'Pessoa Física'; // Tipo de cadastro selecionado

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
                      const SizedBox(height: 40),

                      // Exibe a logo
                      Image.asset(
                        'assets/logo.png',
                        height: 80,
                      ),
                      const SizedBox(height: 40),

                      // Card que contém o formulário de cadastro
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth:
                              600, // Define um limite de largura para manter responsividade
                        ),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Título do formulário
                                const Text(
                                  'Cadastre-se agora',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Dropdown para seleção do tipo de cadastro e campo de CPF/CNPJ
                                Row(
                                  children: [
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
                                                BorderRadius.circular(5.0),
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
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Campos de nome e sobrenome
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
                                                BorderRadius.circular(5.0),
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
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: firstNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Email ',
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextField(
                                        controller: lastNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Whatsapp',
                                          prefixIcon: const Icon(
                                            Icons.person_outline,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: firstNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Senha ',
                                          prefixIcon: const Icon(
                                            Icons.person,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: TextField(
                                        controller: lastNameController,
                                        decoration: InputDecoration(
                                          labelText: 'Confirmar Senha ',
                                          prefixIcon: const Icon(
                                            Icons.person_outline,
                                            color: Color(0xFF002145),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Botão de cadastro
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF001C70),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
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

                      // Link para login (fora do Card)
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          'Já tem login? Clique aqui',
                          style: TextStyle(
                            color: Colors.white,
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
