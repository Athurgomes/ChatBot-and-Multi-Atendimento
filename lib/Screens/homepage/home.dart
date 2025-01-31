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
    // Simula carregamento de dados
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
        // Adicione mais conversas...
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
          conv.nome.toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: _buildAppBar(),
      body: RefreshIndicator(
        onRefresh: () async => _carregarConversas(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cards de Estatísticas
                _buildStatsCards(),
                const SizedBox(height: 20),

                // Ações Rápidas e Filtros
                _buildQuickActions(),
                const SizedBox(height: 20),

                // Filtros de Status
                _buildStatusFilters(),
                const SizedBox(height: 20),

                // Lista de Conversas
                _buildConversasList(conversasFiltradas),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _novaConversa(context),
        child: const Icon(Icons.add_comment),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: _showSearch
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Pesquisar conversas...',
                border: InputBorder.none,
              ),
              onChanged: (value) => setState(() {}),
            )
          : const Text('Painel de Atendimento'),
      actions: [
        IconButton(
          icon: Icon(_showSearch ? Icons.close : Icons.search),
          onPressed: () => setState(() => _showSearch = !_showSearch),
        ),
        PopupMenuButton<String>(
          onSelected: (value) => _filtrarConversas(value),
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'Todas', child: Text('Todas')),
            const PopupMenuItem(value: 'Aberta', child: Text('Abertas')),
            const PopupMenuItem(value: 'Fechada', child: Text('Fechadas')),
            const PopupMenuItem(value: 'Pendente', child: Text('Pendentes')),
          ],
        ),
      ],
    );
  }

  Widget _buildStatsCards() {
    return const Row(
      children: [
        Expanded(
          child: _StatCard(
            title: "Conversas",
            value: "24",
            subTitle: "+12% vs ontem",
            color: Colors.blue,
            icon: Icons.chat_bubble,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            title: "Satisfação",
            value: "94%",
            subTitle: "Meta: 90%",
            color: Colors.green,
            icon: Icons.emoji_emotions,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        ActionChip(
          avatar: const Icon(Icons.smart_toy, size: 18),
          label: const Text("Chatbots Ativos"),
          onPressed: () {},
        ),
        ActionChip(
          avatar: const Icon(Icons.analytics, size: 18),
          label: const Text("Relatórios"),
          onPressed: () {},
        ),
        ActionChip(
          avatar: const Icon(Icons.tag, size: 18),
          label: const Text("Etiquetas"),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildStatusFilters() {
    const List<String> statusList = ['Todas', 'Aberta', 'Fechada', 'Pendente'];
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: statusList.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final status = statusList[index];
          return ChoiceChip(
            label: Text(status),
            selected: _filtroStatus == status,
            onSelected: (selected) => _filtrarConversas(selected ? status : 'Todas'),
          );
        },
      ),
    );
  }

  Widget _buildConversasList(List<Conversa> conversas) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: conversas.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final conversa = conversas[index];
        return ListTile(
          leading: _buildCanalIcon(conversa.canal),
          title: Text(conversa.nome),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(conversa.ultimaMensagem),
              const SizedBox(height: 4),
              _buildPriorityTag(conversa.prioridade),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(conversa.hora, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              _buildStatusIndicator(conversa.status),
            ],
          ),
          onTap: () => Navigator.pushNamed(context, '/chat'),
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
      break; // Adicione 'break' aqui
    case 'Email':
      icon = Icons.email;
      color = Colors.blue;
      break; // Adicione 'break' aqui
    default:
      icon = Icons.chat;
      color = Colors.grey;
      break; // Adicione 'break' aqui
  }
  return CircleAvatar(
    backgroundColor: color.withOpacity(0.1),
    child: (canal == 'WhatsApp') 
        ? FaIcon(icon, color: color, size: 20) // Tamanho ajustado
        : Icon(icon, color: color),
  );
}

  Widget _buildPriorityTag(String prioridade) {
    Color color;
    switch (prioridade) {
      case 'Alta':
        color = Colors.red;
      case 'Média':
        color = Colors.orange;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        prioridade,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildStatusIndicator(String status) {
    Color color;
    switch (status) {
      case 'Aberta':
        color = Colors.green;
      case 'Pendente':
        color = Colors.orange;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.circle, size: 12, color: color),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Métricas"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Clientes"),
      ],
    );
  }

  void _novaConversa(BuildContext context) {
    // Implemente a lógica para nova conversa
  }
}

// Modelo de dados para conversas
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

// Widget para os cards de estatísticas
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    this.subTitle = '',
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: color, fontSize: 14)),
              Text(value, style: TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.bold)),
              if (subTitle.isNotEmpty)
                Text(subTitle, style: TextStyle(color: color.withOpacity(0.8), fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// Tela de detalhes do chat (exemplo básico)
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