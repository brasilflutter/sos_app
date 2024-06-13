import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../../../app/theme/app_assets.dart';
import '../../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../../app/theme/font_manager.dart';
import '../../../../../../core/common_widgets/common_button.dart';
import '../../../../../../utilities/extensions/responsive.dart';
import '../../../controllers/locate_controller.dart';

class LocateBodyWidget extends StatelessWidget {
  const LocateBodyWidget({
    required this.theme,
    required this.controller,
    super.key,
  });
  final LocateController controller;
  final SosAppThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: controller.imageNotifier,
      builder: (__, state, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.chipController,
              decoration: const InputDecoration(
                labelText: 'Número do microchip',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              onChanged: (value) => controller.verifyFields(value: value),
            ),
            SizedBox(height: 25.sp),
            if (controller.imageNotifier.value != null)
              Text(
                'Biometria facil',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 16.sp),
              ),
            SizedBox(height: 15.sp),
            CommonButtonWidget(
              label: controller.imageNotifier.value == null
                  ? 'Selecionar Imagem'
                  : 'Imagem Selecionada',
              iconSize: 20,
              borderRadius: 12,
              width: 379.width,
              height: 72.38.width,
              iconSvg: AppAssets.selectImage,
              backgroundColor: const Color(0xFFF2A9A2),
              textStyle: getSemiBoldStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              onTap: controller.getImage,
            ),
          ],
        );
      },
    );
  }
}
