import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[800],
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/chat': (context) => const ChatDetailPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Conversa> conversas = [];
  bool _showSearch = false;
  String _filtroStatus = 'Todas';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _carregarConversas();
  }

  void _carregarConversas() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      conversas = [
        Conversa(
          nome: 'Maria Silva',
          ultimaMensagem: 'Gostaria de saber o status do meu pedido.',
          canal: 'WhatsApp',
          status: 'Aberta',
          hora: '10:30 AM',
          prioridade: 'Alta',
        ),
        Conversa(
          nome: 'João Souza',
          ultimaMensagem: 'Problema com login no sistema.',
          canal: 'Email',
          status: 'Pendente',
          hora: '09:45 AM',
          prioridade: 'Média',
        ),
      ];
    });
  }

  void _filtrarConversas(String status) {
    setState(() {
      _filtroStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Conversa> conversasFiltradas = conversas.where((conv) {
      return (_filtroStatus == 'Todas' || conv.status == _filtroStatus) &&
          conv.nome
              .toLowerCase()
              .contains(_searchController.text.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          _buildConversasList(conversasFiltradas),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_comment),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _showSearch
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(hintText: 'Pesquisar...'),
              onChanged: (value) => setState(() {}),
            )
          : const Text('Painel de Atendimento'),
      actions: [
        IconButton(
          icon: Icon(_showSearch ? Icons.close : Icons.search),
          onPressed: () => setState(() => _showSearch = !_showSearch),
        ),
      ],
    );
  }

  Widget _buildConversasList(List<Conversa> conversas) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: conversas.length,
      itemBuilder: (context, index) {
        final conversa = conversas[index];
        return ListTile(
          leading: _buildCanalIcon(conversa.canal),
          title: Text(conversa.nome),
          subtitle: Text(conversa.ultimaMensagem),
          trailing: Text(conversa.hora, style: const TextStyle(fontSize: 12)),
        );
      },
    );
  }

  Widget _buildCanalIcon(String canal) {
    IconData icon;
    Color color;
    switch (canal) {
      case 'WhatsApp':
        icon = FontAwesomeIcons.whatsapp;
        color = Colors.green;
        break;
      case 'Email':
        icon = Icons.email;
        color = Colors.blue;
        break;
      default:
        icon = Icons.chat;
        color = Colors.grey;
    }
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.1),
      child: FaIcon(icon, color: color, size: 20),
    );
  }
}

class Conversa {
  final String nome;
  final String ultimaMensagem;
  final String canal;
  final String status;
  final String hora;
  final String prioridade;

  Conversa({
    required this.nome,
    required this.ultimaMensagem,
    required this.canal,
    required this.status,
    required this.hora,
    required this.prioridade,
  });
}

class ChatDetailPage extends StatelessWidget {
  const ChatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes da Conversa')),
      body: const Center(child: Text('Tela de conversa detalhada')),
    );
  }
}
