import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../app/theme/font_manager.dart';
import '../../../../../core/common_widgets/common_button.dart';
import '../../../../../core/common_widgets/common_checkbox.dart';
import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';
import 'auth_header.dart';

class AuthFormSignUpWidget extends StatelessWidget {
  const AuthFormSignUpWidget({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.acceptTerms,
    required this.onAcceptTermsChanged,
    required this.onSubmit,
    super.key,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool acceptTerms;
  final ValueChanged<bool> onAcceptTermsChanged;

  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.width),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AuthHeaderWidget(
              title: 'Criar conta',
              subTitle: '',
            ),
            CommonTextField(
              label: 'E-mail',
              placeholder: 'exemplo@gmail.com',
              controller: emailController,
            ),
            SizedBox(height: 24.width),
            CommonTextField(
              label: 'Senha',
              placeholder: '**********',
              isSecure: true,
              controller: passwordController,
            ),
            SizedBox(height: 24.width),
            CommonTextField(
              label: 'Confirmar Senha',
              placeholder: '**********',
              isSecure: true,
              controller: confirmPasswordController,
            ),
            SizedBox(height: 24.width),
            Row(
              children: [
                CommonCheckboxWidget(
                  value: acceptTerms,
                  onChanged: onAcceptTermsChanged,
                ),
                SizedBox(width: 8.width),
                Text.rich(
                  TextSpan(
                    text: 'Concordo com os ',
                    style: getSemiBoldStyle(
                      color: theme.tertiary,
                      fontSize: 14.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'termos de uso',
                        style: getSemiBoldStyle(
                          color: theme.primaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            CommonButtonWidget(
              label: 'Sign Up',
              width: 380.width,
              height: 65.width,
              backgroundColor: theme.primaryColor,
              textStyle: getSemiBoldStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
              onTap: onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
