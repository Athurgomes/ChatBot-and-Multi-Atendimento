import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Card individual do dashboard com animação
class DashboardCard extends StatefulWidget {
  final String title;
  final String value;

  const DashboardCard({super.key, required this.title, required this.value});

  @override
  State<DashboardCard> createState() => _DashboardCardState();
}

class _DashboardCardState extends State<DashboardCard> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Altera o cursor ao passar o mouse
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(5)), // Arredondamento das bordas do card
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(widget.value,
                  style: const TextStyle(fontSize: 26, color: Colors.blue)),
            ],
          ),
        ).animate().fade(duration: 500.ms).scale(), // Animação do card
      ),
    );
  }
}
