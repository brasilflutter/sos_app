import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../app/theme/font_manager.dart';
import '../../../../../core/common_widgets/common_button.dart';
import '../../../../../core/common_widgets/common_text_field.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';
import 'auth_header.dart';

class AuthFormSignInWidget extends StatelessWidget {
  const AuthFormSignInWidget({
    required this.onForgotPassword,
    required this.onSubmit,
    super.key,
  });

  final VoidCallback onForgotPassword;
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
              title: 'Login',
              subTitle: 'Seja bem vindo!',
            ),
            const CommonTextField(
              label: 'E-mail',
              placeholder: 'exemplo@gmail.com',
            ),
            SizedBox(height: 24.width),
            const CommonTextField(
              label: 'Senha',
              placeholder: '**********',
              isSecure: true,
            ),
            SizedBox(height: 22.width),
            Row(
              children: [
                GestureDetector(
                  onTap: onForgotPassword,
                  child: Text(
                    'Esqueci minha senha',
                    style: getRegularStyle(
                      color: theme.primaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            CommonButtonWidget(
              label: 'Sign In',
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
