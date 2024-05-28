import 'package:flutter_modular/flutter_modular.dart';

import 'ui/controlles/onboarding_controller.dart';
import 'ui/screens/onboading_screen.dart';

class OnboardingModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(OnboadingController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => OnboardingScreen(
        controller: Modular.get<OnboadingController>(),
      ),
    );
  }
}
