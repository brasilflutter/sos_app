import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/pet_attribute_repository_mock.dart';
import 'data/repositories/pet_repository_mock.dart';
import 'domain/repositories/pet_attribute_repository.dart';
import 'domain/repositories/pet_repository.dart';
import 'ui/controllers/pet_cadastro_controller.dart';
import 'ui/pages/pet_create_page.dart';
import 'ui/pages/pet_update_page.dart';
import 'ui/store/pet_cadastro_store.dart';

class PetModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<PetAttributeRepository>(PetAttributeRepositoryMock.new);
    i.addSingleton<PetRepository>(PetRepositoryMock.new);

    i.add(PetCadastroStore.new);

    i.addLazySingleton(PetCadastroController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => Container(),
    );

    r.child(
      '/cadastro',
      child: (context) => PetCadastroPage(
        controller: Modular.get<PetCadastroController>(),
      ),
    );

    r.child(
      '/cadastro/:id',
      child: (context) => PetUpdatePage(
        controller: Modular.get<PetCadastroController>(),
        id: int.parse(r.args.params['id']),
      ),
    );
  }
}
