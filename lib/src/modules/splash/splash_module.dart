import 'package:flutter_modular/flutter_modular.dart';

import '../../app/app_routes.dart';
import 'ui/controllers/splash_controller.dart';
import 'ui/screens/splash_screen.dart';

class SplashModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(SplashController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.splash.path,
      child: (_) => SplashScreen(
        controller: Modular.get<SplashController>(),
      ),
    );
  }
}
