import 'package:controle_gastos/entities/Iten_sentity.dart';

import 'package:controle_gastos/components/icon_button_component.dart';
import 'package:controle_gastos/components/spacer_component.dart';
import 'package:flutter/material.dart';

class NovoItemWidget extends StatefulWidget {
  final void Function(Itensentity item) callback;

  const NovoItemWidget({
    super.key,
    required this.callback,
  });

  @override
  State<NovoItemWidget> createState() => _NovoItemWidgetState();
}

enum TipoLista { tarefa }

class _NovoItemWidgetState extends State<NovoItemWidget> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyTarefas = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _valorController = TextEditingController();

  List<TextEditingController> itens = [];
  TipoLista dropdownValue = TipoLista.tarefa;

//Campos exibidos quando se clina em add gasto
  Widget defaultCheckItem(TextEditingController nomeController, TextEditingController valorController) {
  return Column(
    children: [
      Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(hintText: 'Nome do produto'),
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Por favor, digite um nome'
                    : null;
              },
            ),
          ),
          const SpaceComponent(), // Espaçamento entre os campos
          Expanded(
            child: TextFormField(
              controller: valorController,
              decoration: const InputDecoration(hintText: 'Valor produto'),
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? 'Por favor, digite um Valor'
                    : null;
              },
            ),
          ),
        ],
      ),
    ],
  );
}



  void handleSubmit() {
    final isValido = _formKey.currentState!.validate();
    if (isValido) {
      final item = Itensentity(
        uuid: 'xpto',
        titulo: _titleController.text,
        valor: double.parse(_valorController.text),
        dataRegistro: DateTime.now(),
      );

      bool valid = false;

      if (dropdownValue == TipoLista.tarefa) {
        final isTarefasValidas = _formKeyTarefas.currentState!.validate();
        if (isTarefasValidas) {
          valid = true;
        }
      } else {
        valid = true;
      }

      if (valid) {
        widget.callback(item);
        Navigator.pop(context);
      }
    }
  }

//metodo recebe um textecontrole e add ele na lista de itens 
  void addItem() {
      itens.add(TextEditingController());
      setState(() {
        itens = itens;
      });
    
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = '';
    _valorController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
        const Row(children: [ Text('Titulo da Lista', style: TextStyle(fontSize: 18))],
        ),        
        TextFormField(
          controller: _titleController,
          decoration: const InputDecoration(hintText: 'Exemplo 07/2023'),
          validator: (value) {if (value == null || value.isEmpty) { return 'Por favor, digite um nome.';}
          return null;
          }),

          // botão de add gastos  
          Row(children: [
              const Text('Add gasto: '),
              IconButtonSelector(
                onPressed: addItem,
                size: 16,
                icon: Icons.add,
              )
            ],
          ),
          Form(
            key: _formKeyTarefas,
            child: Column(children: itens.map(defaultCheckItem).toList()),
          ),
        const SpaceComponent(),
        ElevatedButton(
          onPressed: handleSubmit,
          child: const Text('Cadastrar'),
        ),
      ]),
    );
  }
}
