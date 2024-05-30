import 'package:flutter/material.dart';

import '../controllers/pet_cadastro_controller.dart';
import 'widgets/pet_form.dart';

class PetCadastroPage extends StatefulWidget {
  const PetCadastroPage({required this.controller, super.key});

  final PetCadastroController controller;

  @override
  State<PetCadastroPage> createState() => _PetCadastroPageState();
}

class _PetCadastroPageState extends State<PetCadastroPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Pet'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PetCadastroForm(
              store: widget.controller.store,
            ),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text('Salvar'),
          )
        ],
      ),
    );
  }
}
