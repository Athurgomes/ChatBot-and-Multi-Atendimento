import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Cabeçalho do dashboard
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Dashboard",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0))),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              "https://via.placeholder.com/150"), // Imagem do perfil
        ),
      ],
    ).animate().fade(duration: 400.ms).scale(); // Animação do cabeçalho
  }
}
