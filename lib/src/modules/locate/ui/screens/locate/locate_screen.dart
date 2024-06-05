import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../app/theme/font_manager.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';
import '../../controllers/locate_controller.dart';
import 'widgets/locate_button_widget.dart';
import 'widgets/locate_body_widget.dart';

class LocateScreen extends StatelessWidget {
  const LocateScreen({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final LocateController controller;

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Localizar pet',
                style: getBoldStyle(
                  fontSize: 24,
                  color: theme.primaryColor,
                ),
              ),
            ),
            LocateBodyWidget(
              theme: theme,
              controller: controller,
            ),
            SizedBox(height: 10.height),
            LocateButtonWidget(
              theme: theme,
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
