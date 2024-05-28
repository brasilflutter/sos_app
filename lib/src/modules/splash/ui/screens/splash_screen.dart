// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sos_app/src/core/common_widgets/common_icon.dart';
import 'package:sos_app/src/modules/splash/ui/controllers/splash_controller.dart';

import '../../../../app/theme/app_assets.dart';
import '../states/splash_state.dart';

class SplashScreen extends StatefulWidget {
  final SplashController controller;
  const SplashScreen({
    super.key,
    required this.controller,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (_, state, __) {
            return Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: state is SplashLoaded ? 1 : 0,
                child: const CommonIconWidget(
                  pathSvg: AppAssets.logo,
                ),
              ),
            );
          }),
    );
  }
}
