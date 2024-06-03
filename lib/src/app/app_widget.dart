import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        title: 'SOS App',
        routerConfig: Modular.routerConfig,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightTheme,
      ),
    );
  }
}
