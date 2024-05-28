import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../app/theme/font_manager.dart';
import '../../../../../utilities/responsive.dart';

class OnboardingHeaderWidget extends StatelessWidget {
  const OnboardingHeaderWidget({
    required this.isInitial,
    required this.onJump,
    super.key,
  });
  final bool isInitial;
  final Function() onJump;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.width,
      child: Visibility(
        visible: isInitial,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onJump,
                  child: Text(
                    'Pular',
                    style: getSemiBoldStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 36.width),
            Text(
              'Seja bem vindo!',
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                color: AppColors.primaryColor,
                fontSize: 24.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
