import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const HomePage());
}

// Classe principal do aplicativo
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DashboardPage(),
    );
  }
}

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
                  duration: const Duration(milliseconds: 300),
                  width: isMenuExpanded ? 250 : 60,
                  child: SideMenu(
                    isExpanded: isMenuExpanded,
                    onToggle: () {
                      setState(() {
                        isMenuExpanded = !isMenuExpanded;
                      });
                    },
                  ),
                ).animate().slideX(duration: 500.ms), // Animação de slide
                const Expanded(
                    flex: 6, child: DashboardContent()), // Conteúdo principal
              ],
            ),
            // Exibição do calendário
            if (isCalendarVisible)
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    onDateChanged: (date) {},
                  ),
                )
                    .animate()
                    .fade(duration: 400.ms)
                    .scale(), // Animação do calendário
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isCalendarVisible = !isCalendarVisible;
          });
        },
        child: const Icon(Icons.calendar_today),
      ).animate().scale(duration: 300.ms), // Animação do botão de calendário
    );
  }
}

// Menu lateral do dashboard
class SideMenu extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SideMenu({super.key, required this.isExpanded, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 17, 0, 115),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animação no título "AssisFlow"
              if (isExpanded)
                Text(
                  "InovaSys",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).animate().fade(duration: 500.ms).scale(),
              IconButton(
                icon: Icon(isExpanded
                    ? Icons.arrow_back_ios
                    : Icons.arrow_forward_ios),
                color: Colors.white,
                onPressed: onToggle,
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
                  const Color.fromARGB(179, 255, 255, 255)), // Cor dos icones
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

// Conteúdo principal do dashboard
class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          SizedBox(height: 20),
          Expanded(child: DashboardGrid()), // Grade de cards
        ],
      ),
    ).animate().fade(duration: 500.ms); // Animação do conteúdo principal
  }
}

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
                color: Colors.white)),
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage("https://via.placeholder.com/150"),
        ),
      ],
    ).animate().fade(duration: 400.ms).scale(); // Animação do cabeçalho
  }
}

// Grade de cards do dashboard
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: MediaQuery.of(context).size.width > 900 ? 4 : 1,
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
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
