// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../app/theme/app_assets.dart';
import '../../../../core/common_widgets/common_icon.dart';
import '../../../../utilities/navigation.dart';
import '../../../../utilities/responsive.dart';
import '../controllers/splash_controller.dart';
import '../states/splash_state.dart';

class SplashScreen extends StatefulWidget {
  final SplashController controller;
  const SplashScreen({
    required this.controller,
    super.key,
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
          if (state is SplashLoaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.navigate(state.route);
            });
          }
          return Center(
            child: AnimatedOpacity(
              duration: const Duration(seconds: 1),
              opacity: state is SplashLoading ? 1 : 0,
              child: CommonIconWidget(
                pathSvg: AppAssets.logo,
                width: 428.width,
              ),
            ),
          );
        },
      ),
    );
  }
}
