import 'package:flutter_modular/flutter_modular.dart';

import 'ui/screens/sign_in_screen.dart';

class AuthModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const SignInScreen());
  }
}
