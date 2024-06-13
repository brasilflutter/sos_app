import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../../app/theme/font_manager.dart';
import '../../../../../../utilities/extensions/responsive.dart';

class TitleBackBarWidget extends StatelessWidget {
  const TitleBackBarWidget({required this.theme, super.key});
  final SosAppThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 37,
          backgroundColor: theme.primaryColor,
          child: IconButton(
            icon: const Icon(
              size: 25,
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Modular.to.pop();
            },
          ),
        ),
        SizedBox(width: 20.width),
        Text(
          'Localizar pet',
          style: getBoldStyle(
            fontSize: 25,
            color: theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
