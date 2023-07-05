import 'package:controle_gastos/components/icon_button_component.dart';
import 'package:controle_gastos/components/spacer_component.dart';
import 'package:flutter/material.dart';


class PerfilTab extends StatelessWidget {
  const PerfilTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Card(
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(children: [
              const CircleAvatar(child: Text('R')),
              const SpaceComponent(size: 8, isHorizontal: true),
              const Text('Rafael Silva', style: TextStyle(fontWeight: FontWeight.bold)),
              const SpaceComponent(isFull: true),
              IconButtonSelector(
                icon: Icons.more_vert,
                onPressed: () {},
              ),
            ]),
          ),
        ),
        const SpaceComponent(),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Total de notas: '),
          Text('0'),
        ]),
        const SpaceComponent(),
        const Row(children: [
          Icon(Icons.list),
          SizedBox(width: 8),
          Text('Concluídas: '),
          Text('0'),
        ]),
        const SpaceComponent(),
        const Divider(),
        const SpaceComponent(),
        const Text(
          'Minhas estatísticas',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        Row(children: [
          const Text('Tema escuro'),
          const SpaceComponent(isFull: true),
          Switch(value: true, onChanged: (val) {}),
        ])
      ]),
    );
  }
}