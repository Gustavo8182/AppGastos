import 'package:controle_gastos/pages/home/abas/listar_itens_tab.dart';
import 'package:controle_gastos/pages/home/abas/perfil_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
late int abaSelecionada;

void handletab(int tabIndex){
  setState(() {
    abaSelecionada = tabIndex;
  });
}
  @override
  void initState(){
    abaSelecionada = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<BottomNavigationBarItem> _abas = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      const BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Perfil'),
    ];

    final List<Widget> _conteudos = [
      const ListarItens(),
      const PerfilTab(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Controle De Gastos')),
      body: _conteudos.elementAt(abaSelecionada),
      bottomNavigationBar: BottomNavigationBar(
        onTap: handletab,
        currentIndex: abaSelecionada,
        items: _abas,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          handletab(1);},
          child: const Icon(Icons.add),),
    );
  }
}