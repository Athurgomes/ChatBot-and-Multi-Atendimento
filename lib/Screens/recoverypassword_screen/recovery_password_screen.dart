import 'package:flutter/material.dart'
    show
        Alignment,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        Image,
        InputDecoration,
        LinearGradient,
        MainAxisAlignment,
        MainAxisSize,
        Navigator,
        OutlineInputBorder,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Step,
        Stepper,
        Text,
        TextButton,
        TextField,
        TextStyle,
        Widget;

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({super.key});

  @override
  _RecoveryPasswordScreenState createState() => _RecoveryPasswordScreenState();
}

class _RecoveryPasswordScreenState extends State<RecoveryPasswordScreen> {
  // Controle das etapas
  int _currentStep = 0;

  // Passos de recuperação de senha
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 17, 0, 115),
              Color.fromARGB(255, 0, 42, 50),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: 450.0, // Ajuste o tamanho do container conforme necessário
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Logo acima do título Recuperação de Senha
                  Image.asset(
                    'assets/logo.png', // Coloque o caminho correto da sua logo
                    height: 100, // Tamanho da logo
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'Recuperação de Senha',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  // Passos para recuperação
                  Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (int step) {
                      setState(() {
                        _currentStep = step;
                      });
                    },
                    onStepContinue: () {
                      if (_currentStep < 2) {
                        setState(() {
                          _currentStep++;
                        });
                      } else {
                        // Finalizar recuperação ou seguir para outra página
                      }
                    },
                    onStepCancel: () {
                      if (_currentStep > 0) {
                        setState(() {
                          _currentStep--;
                        });
                      }
                    },
                    steps: [
                      Step(
                        title: Text('Digite o email'),
                        content: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Lógica para enviar o código para o email
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 17, 0, 115),
                                ),
                                child: const Text(
                                  'Enviar código',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text('Digite o código do email'),
                        content: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Código do email',
                                labelStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Lógica para verificar o código do email
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 17, 0, 115),
                                ),
                                child: const Text(
                                  'Verificar código',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Step(
                        title: Text('Digite o código do WhatsApp'),
                        content: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                labelText: 'Código do WhatsApp',
                                labelStyle: TextStyle(color: Colors.black54),
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            SizedBox(
                              width: 300.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Lógica para concluir a recuperação de senha
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 17, 0, 115),
                                ),
                                child: const Text(
                                  'Concluir recuperação',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  // Botão para voltar à tela de login
                  TextButton(
                    onPressed: () {
                      // Voltar para a tela de login
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Voltar para Login',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
