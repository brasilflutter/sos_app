import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../../app/theme/font_manager.dart';
import '../../../../../../core/common_widgets/common_button.dart';
import '../../../../../../utilities/extensions/responsive.dart';
import '../../../controllers/locate_controller.dart';

class LocateButtonWidget extends StatelessWidget {
  const LocateButtonWidget({
    required this.controller,
    required this.theme,
    super.key,
  });
  final LocateController controller;
  final SosAppThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.isEnabledButton,
      builder: (BuildContext context, bool value, Widget? child) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: CommonButtonWidget(
            label: 'Localizar',
            width: 380.width,
            height: 56.width,
            backgroundColor:
                controller.isEnabledButton.value ? theme.primaryColor : const Color(0xFFF2A9A2),
            textStyle: getSemiBoldStyle(
              color: Colors.white,
              fontSize: 16.sp,
            ),
            onTap: () {
              if (!controller.isEnabledButton.value) {
                return;
              }

              Modular.to.pushNamed('/locate-detail');
            },
          ),
        );
      },
    );
  }
}
