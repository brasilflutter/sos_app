import 'package:flutter_modular/flutter_modular.dart';

import '../modules/auth/auth_mobule.dart';
import '../modules/onboarding/onboarding_module.dart';
import '../modules/shell/shell_module.dart';
import '../modules/splash/splash_module.dart';
import 'app_routes.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module(AppRoutes.splash, module: SplashModule());
    r.module(AppRoutes.onboarding, module: OnboardingModule());
    r.module(AppRoutes.auth, module: AuthModule());
    r.module(AppRoutes.shell, module: ShellModule());
  }
}
