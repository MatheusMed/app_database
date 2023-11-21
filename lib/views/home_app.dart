import 'package:app_teste_floor/controller/app_home_controller.dart';
import 'package:app_teste_floor/model/tarefa_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<AppHomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller.tituloC,
          ),
          TextField(
            controller: controller.descrC,
          ),
          TextButton(
            onPressed: () async {
              final tarefa = TarefaModel(
                titulo: controller.tituloC.text,
                descricao: controller.descrC.text,
                status: 'APROVADO',
              );
              await controller.insert(tarefa);
            },
            child: const Text('Salvar'),
          ),
          FilledButton(
              onPressed: () async {
                await controller.getAll();
              },
              child: const Text('Get'))
        ],
      ),
    );
  }
}
