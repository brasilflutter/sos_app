import 'package:flutter/material.dart';

import '../controllers/pet_cadastro_controller.dart';
import 'widgets/pet_form.dart';

class PetUpdatePage extends StatefulWidget {
  const PetUpdatePage({
    required this.controller,
    required this.id,
    super.key,
  });

  final PetCadastroController controller;
  final int id;

  @override
  State<PetUpdatePage> createState() => _PetUpdatePageState();
}

class _PetUpdatePageState extends State<PetUpdatePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        init();
      },
    );
  }

  Future<void> init() async {
    final pet = await widget.controller.getPet(widget.id);
    widget.controller.setPetAttributes(pet);

    if (!mounted) {
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Pet'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: PetCadastroForm(
                    store: widget.controller.store,
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Salvar'),
                ),
              ],
            ),
    );
  }
}
