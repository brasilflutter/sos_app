import 'package:flutter_modular/flutter_modular.dart';

import 'ui/controllers/locate_controller.dart';
import 'ui/screens/detail/locate_details_screen.dart';
import 'ui/screens/locate/locate_screen.dart';

class LocateModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(LocateController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => LocateScreen(
        controller: Modular.get<LocateController>(),
      ),
    );
    r.child(
      '/locate-detail',
      child: (_) => LocateDetailsScreen(
        controller: Modular.get<LocateController>(),
      ),
    );
  }
}
