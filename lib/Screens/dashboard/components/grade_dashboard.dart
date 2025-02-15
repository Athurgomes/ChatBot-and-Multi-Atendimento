import 'package:flutter/material.dart';
import 'card_dashboard.dart'; // Importa o card do dashboard

// Grade de cards do dashboard
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 900
          ? 4
          : 1, // Adaptação para telas grandes e pequenas
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: const [
        DashboardCard(title: "Atendimentos", value: "0"),
        DashboardCard(title: "Chatbot", value: "0"),
        DashboardCard(title: "Agendamentos", value: "0"),
        DashboardCard(title: "Atendentes Online", value: "0"),
      ],
    );
  }
}
