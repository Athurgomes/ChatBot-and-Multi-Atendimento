import 'package:chatbot_multiatendimento/Screens/dashboard/components/conteudo_dashboard.dart';
import 'package:chatbot_multiatendimento/Screens/dashboard/menu/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:chatbot_multiatendimento/Screens/componentes/menu/menu_lateral.dart'; // Importa o menu lateral
import 'package:chatbot_multiatendimento/Screens/componentes/dashboard/conteudo_dashboard.dart'; // Importa o conteúdo do dashboard
import 'package:chatbot_multiatendimento/Screens/componentes/calendario.dart'; // Importa o calendário

// Página principal do dashboard
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isMenuExpanded = true; // Controle de expansão do menu
  bool isCalendarVisible = false; // Controle da visibilidade do calendário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                // Menu lateral animado
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: isMenuExpanded ? 250 : 60,
                  child: SideMenu(
                    isExpanded: isMenuExpanded,
                    onToggle: () {
                      setState(() {
                        isMenuExpanded =
                            !isMenuExpanded; // Alterna a expansão do menu
                      });
                    },
                  ),
                )
                    .animate()
                    .slideX(duration: 500.ms), // Animação de slide no menu
                const Expanded(
                    flex: 6,
                    child:
                        DashboardContent()), // Conteúdo principal do dashboard
              ],
            ),
            // Exibição do calendário se a variável 'isCalendarVisible' for verdadeira
            if (isCalendarVisible)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {}, // Função de alteração da data
                  ),
                )
                    .animate()
                    .fade(duration: 400.ms)
                    .scale(), // Animação de fade e escala no calendário
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isCalendarVisible =
                !isCalendarVisible; // Alterna a visibilidade do calendário
          });
        },
        child: const Icon(Icons.calendar_today), // Ícone do botão de calendário
      ).animate().scale(duration: 150.ms), // Animação do botão de calendário
    );
  }
}
