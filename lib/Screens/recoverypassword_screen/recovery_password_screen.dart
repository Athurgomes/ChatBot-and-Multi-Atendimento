import 'package:flutter/material.dart';
import 'package:chatbot_multiatendimento/Screens/login_screen/login.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  _RecoveryPasswordScreenState createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController whatsappController = TextEditingController();
  final TextEditingController emailCodeController = TextEditingController();
  final TextEditingController whatsappCodeController = TextEditingController();

  String recoveryMethod = 'email'; // Método de recuperação padrão

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
                  Color.fromARGB(255, 26, 90, 153),
                  Color(0xFF004CFF),
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
                      Image.asset(
                        'assets/logo.png',
                        height: 80,
                      ),
                      const SizedBox(height: 40),
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 600,
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
                                const Text(
                                  'Recuperação de Senha',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),

                                // Opção de escolha do método de recuperação
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Radio<String>(
                                      value: 'email',
                                      groupValue: recoveryMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          recoveryMethod = value!;
                                        });
                                      },
                                    ),
                                    const Text('E-mail'),
                                    const SizedBox(width: 20),
                                    Radio<String>(
                                      value: 'whatsapp',
                                      groupValue: recoveryMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          recoveryMethod = value!;
                                        });
                                      },
                                    ),
                                    const Text('WhatsApp'),
                                  ],
                                ),
                                const SizedBox(height: 16),

                                // Exibir campos de acordo com o método selecionado
                                if (recoveryMethod == 'email') ...[
                                  _buildTextField(
                                      emailController, 'E-mail', Icons.email),
                                  const SizedBox(height: 16),
                                  _buildTextField(emailCodeController,
                                      'Código do E-mail', Icons.vpn_key),
                                ] else ...[
                                  _buildTextField(whatsappController,
                                      'Número do WhatsApp', Icons.phone),
                                  const SizedBox(height: 16),
                                  _buildTextField(whatsappCodeController,
                                      'Código do WhatsApp', Icons.lock),
                                ],
                                const SizedBox(height: 24),

                                // Botão para recuperar senha
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF004CFF),
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: const Text(
                                    'Recuperar Senha',
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

                      // Link para voltar ao login
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

  // Método para construir campos de texto com ícone e borda arredondada
  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF002145)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
