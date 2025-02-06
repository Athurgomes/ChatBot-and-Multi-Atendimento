import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:fl_chart/fl_chart.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 48, 47, 47), // Fundo da página em cinza claro
      body: Column(
        children: [
          HeaderTopBar(),
          Expanded(
            child: Row(
              children: [
                SidebarMenu(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10), // Reduzindo espaço superior
                          child: HeaderSection(),
                        ),
                        SizedBox(height: 10), // Reduzindo espaçamento
                        StatisticsSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 48, 47, 47), // Fundo do topo em cinza claro
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 48, 47, 47), // Fundo da mensagem de conexão em cinza claro
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.wifi, color: Colors.white, size: 16),
                    SizedBox(width: 5),
                    Text("Conectado", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Text("Canal: AssistFlow", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 10),
              Icon(Icons.notifications, color: Colors.red),
              SizedBox(width: 10),
              Icon(Icons.smart_toy, color: Colors.blue),
              SizedBox(width: 10),
              Icon(Icons.person, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}

class SidebarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: const Color(0xFF001C70),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "AssistFlow",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          _menuItem(Icons.chat, "Atendimentos"),
          _menuItem(Icons.schedule, "Agendamentos"),
          _menuItem(Icons.smart_toy, "ChatBot"),
          _menuItem(Icons.message, "Base de Mensagens"),
          Divider(color: Colors.white70),
          Text(
            "Configurações",
            style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          _menuItem(Icons.power, "Canais"),
          _menuItem(Icons.storage, "Setores"),
          _menuItem(Icons.person, "Atendentes"),
          _menuItem(Icons.label, "Etiquetas"),
          _menuItem(Icons.layers, "Grupos"),
          _menuItem(Icons.contacts, "Contatos"),
        ],
      ),
    );
  }

  Widget _menuItem(IconData icon, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
        ],
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Loja Teste", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.grey),
              SizedBox(width: 5),
              Text("Vencimento: NADA"),
              SizedBox(width: 20),
              Switch(value: true, onChanged: (val) {}),
            ],
          ),
        ],
      ),
    );
  }
}

class StatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _statCard("Total", "0", Icons.pie_chart, Colors.purple),
        _statCard("Atendimento", "0", Icons.people, Colors.green),
        _statCard("Pendentes", "0", Icons.update, Colors.orange),
        _statCard("Bot", "1", Icons.smart_toy, Colors.blue),
        _statCard("Finalizado", "0", Icons.check_circle, Colors.teal),
      ],
    );
  }

  Widget _statCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
