import 'package:controle_gastos/components/spacer_component.dart';
import 'package:controle_gastos/pages/home/components/novo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:controle_gastos/entities/Iten_sentity.dart';

class ListarItens extends StatefulWidget {
  const ListarItens({
    super.key,
  });

  @override
  State createState() => _ListarItens();
}

class _ListarItens extends State<ListarItens> {
  late List<Itensentity> _listadeItens;

 void handleAdicionar() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(16),
          children: [
            NovoItemWidget(callback: (item) {
              _listadeItens.add(item);
              setState(() {
                _listadeItens = _listadeItens;
              });
            }),
          ],
        );
      },
    );
  }

  void handleExcluir(int index) {
    _listadeItens.removeAt(index);
    setState(() {
      _listadeItens = _listadeItens;
    });
  }

  @override
  void initState() {
    _listadeItens = [
      Itensentity(
        uuid: 'teste1',
        titulo: 'Teste 1',
        valor: 10.50,
        dataRegistro: DateTime.now(),
      ),
      Itensentity(
        uuid: 'teste2',
        titulo: 'Teste 2',
        valor: 80.00,
        dataRegistro: DateTime.now(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: handleAdicionar,
          child: const Text('Adicionar'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: ListView.builder(
            itemCount: _listadeItens.length,
            itemBuilder: (context, index) {
              final item = _listadeItens.elementAt(index);
              return Dismissible(
                key: Key(item.uuid),
                onDismissed: (direction) {
                  if (direction == DismissDirection.startToEnd) {
                    handleExcluir(index);
                  }
                },
                 child: Padding(
                    padding: const EdgeInsets.only(bottom: 7),
                    child: Card(
                      child: ListTile(
                        title: Text(item.titulo),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 26,
                            )),
                      ),
                    ),
                  )); //Text(item.titulo));
            },
          ),
        ),
        const SpaceComponent(),
      ],
    );
  }
}