import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'item_menu.dart'; // Importa o item do menu

// Menu lateral do dashboard
class SideMenu extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SideMenu({super.key, required this.isExpanded, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color(0xFF31679C), // Azul mais escuro
          Color(0xFF004CFF), // Azul mais claro
        ],
        begin: Alignment.topCenter, // Direção do degrade
        end: Alignment.topCenter,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animação no título "InovaSys" quando o menu está expandido
              if (isExpanded)
                Text(
                  "INOVASYS", // Nome da empresa
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
                    .animate()
                    .fade(duration: 500.ms)
                    .scale(), // Animação de fade e escala
              IconButton(
                icon: Icon(isExpanded
                    ? Icons.arrow_back_ios
                    : Icons
                        .arrow_forward_ios), // Ícone de expansão ou contração do menu
                color: Colors.white,
                onPressed: onToggle, // Alterna o estado de expansão
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Itens do menu com animação
          MenuItem(
              icon: Icons.dashboard,
              title: "Dashboard",
              isExpanded: isExpanded),
          MenuItem(icon: Icons.chat, title: "Chatbot", isExpanded: isExpanded),
          MenuItem(
              icon: Icons.event, title: "Agendamentos", isExpanded: isExpanded),
          MenuItem(
              icon: Icons.settings,
              title: "Configurações",
              isExpanded: isExpanded),
        ],
      ),
    );
  }
}
