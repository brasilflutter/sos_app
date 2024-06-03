// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../app/theme/font_manager.dart';
import '../../../../core/common_widgets/common_button.dart';
import '../../../../utilities/extensions/build_context.dart';
import '../../../../utilities/extensions/responsive.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';
import 'components/auth_form_sign_in_widget.dart';
import 'components/auth_form_sign_up_widget.dart';
import 'components/auth_header.dart';

class AuthScreen extends StatefulWidget {
  final AuthController controller;
  const AuthScreen({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (_, state, __) {
          if (state is AuthLoaded) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthHeaderWidget(
                    title: state.viewModel.title,
                    subTitle: state.viewModel.subTitle,
                  ),
                  SizedBox(height: 96.width),
                  Expanded(
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: widget.controller.changePage,
                      children: [
                        const AuthFormSignInWidget(),
                        AuthFormSignUpWidget(
                          emailController: state.emailController,
                          passwordController: state.passwordController,
                          confirmPasswordController: state.confirmPasswordController,
                          acceptTerms: state.acceptTerms,
                          onAcceptTermsChanged: widget.controller.toggleAcceptTerms,
                        ),
                      ],
                    ),
                  ),
                  CommonButtonWidget(
                    label: 'Continuar',
                    width: 380.width,
                    height: 65.width,
                    backgroundColor: theme.primaryColor,
                    textStyle: getSemiBoldStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                    onTap: () {},
                  ),
                  Expanded(child: Container()),
                ],
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
