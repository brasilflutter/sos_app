import 'package:flutter_modular/flutter_modular.dart';

import 'domain/auth_repository.dart';
import 'external/auth_repository_impl.dart';
import 'ui/controllers/auth_controller.dart';
import 'ui/screens/auth_screen.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.add<AuthController>(AuthController.new);
    i.add<AuthRepository>(AuthRepositoryImpl.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => AuthScreen(
        controller: Modular.get(),
      ),
    );
  }
}
