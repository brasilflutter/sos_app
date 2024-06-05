import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';
import '../../controllers/locate_controller.dart';
import 'widgets/pet_list_widget.dart';
import 'widgets/title_back_bar_widget.dart';

class LocateDetailsScreen extends StatelessWidget {
  const LocateDetailsScreen({required this.controller, super.key});
  final LocateController controller;

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 72, left: 24, right: 24),
        child: Column(
          children: [
            TitleBackBarWidget(theme: theme),
            SizedBox(height: 70.height),
            PetListWidget(theme: theme, controller: controller),
          ],
        ),
      ),
    );
  }
}
