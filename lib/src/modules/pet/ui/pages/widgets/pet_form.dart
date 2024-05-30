import 'package:flutter/material.dart';

import '../../store/pet_cadastro_store.dart';

class PetCadastroForm extends StatelessWidget {
  const PetCadastroForm({
    required this.store,
    super.key,
  });

  final PetCadastroStore store;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        children: [
          TextFormField(
            controller: store.petName,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Cor',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Raça',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Espécie',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Sexo',
            ),
          ),
          TextFormField(
            controller: store.foundLocation,
            decoration: const InputDecoration(
              labelText: 'Abrigo Atual',
            ),
          ),
          TextFormField(
            controller: store.foundLocation,
            decoration: const InputDecoration(
              labelText: 'Localização onde foi encontrado',
            ),
          ),
          const _SectionTitle(
            title: 'Acessórios',
          ),
          TextFormField(
            controller: store.collar,
            decoration: const InputDecoration(
              labelText: 'Coleiras',
            ),
          ),
          TextFormField(
            controller: store.microchip,
            decoration: const InputDecoration(
              labelText: 'Microship',
            ),
          ),
          TextFormField(
            controller: store.description,
            decoration: const InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          const _SectionTitle(
            title: 'Contatos',
          ),
          TextFormField(
            controller: store.contactName,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextFormField(
            controller: store.contactWhatsapp,
            decoration: const InputDecoration(
              labelText: 'Whatsapp',
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
