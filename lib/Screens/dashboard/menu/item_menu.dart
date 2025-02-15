import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Classe para representar os itens do menu
class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isExpanded;

  const MenuItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Icon(icon,
              color:
                  const Color.fromARGB(179, 252, 252, 252)), // Cor dos ícones
          if (isExpanded) ...[
            const SizedBox(width: 10),
            // Animação dos itens do menu
            Text(title,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
          ]
        ],
      ).animate().fade(duration: 400.ms).scale(), // Animação de fade e escala
    );
  }
}
