import 'package:flutter_modular/flutter_modular.dart';

import 'ui/pages/shell_page.dart';

class ShellModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const ShellPage(),
    );
  }
}
