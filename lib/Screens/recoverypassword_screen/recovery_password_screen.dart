import 'package:flutter/material.dart';

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

  String recoveryMethod = 'email'; // Default is email

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
                  Color.fromARGB(255, 17, 0, 115),
                  Color.fromARGB(255, 0, 42, 50),
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
                      Image.asset(
                        'assets/logo.png',
                        height: 100,
                      ),
                      const SizedBox(height: 40),
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
                                const Text(
                                  'Recuperação de Senha',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 20.0),

                                // Seleção de método de recuperação
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
                                    const Text(
                                      'E-mail',
                                      style: TextStyle(color: Colors.black87),
                                    ),
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
                                    const Text(
                                      'WhatsApp',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Campos de input dependendo do método selecionado
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

                                // Botão de recuperação
                                SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Lógica para recuperação da senha
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 17, 0, 115),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Recuperar Senha',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Voltar para Login',
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

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF002145)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
