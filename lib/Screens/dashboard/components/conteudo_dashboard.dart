import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'cabecalho_dashboard.dart'; // Importa o cabeçalho do dashboard
import 'grade_dashboard.dart'; // Importa a grade de cards

// Conteúdo principal do dashboard
class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(), // Cabeçalho
          SizedBox(height: 20),
          Expanded(child: DashboardGrid()), // Grade de cards
        ],
      ),
    ).animate().fade(duration: 500.ms); // Animação do conteúdo principal
  }
}
