// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app/app_routes.dart';
import '../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../utilities/extensions/build_context.dart';
import '../../../../utilities/extensions/responsive.dart';
import '../controllers/auth_controller.dart';
import '../states/auth_state.dart';
import 'components/auth_form_sign_in_widget.dart';
import 'components/auth_form_sign_up_widget.dart';

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
  AuthController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.init();
    });
  }

  Future<void> signIn() async {
    final state = widget.controller.value;

    if (state is! AuthLoaded) {
      return;
    }

    await controller.signIn(
      email: state.emailController.text,
      password: state.passwordController.text,
    );

    Modular.to.pushNamedAndRemoveUntil(AppRoutes.shell, (p0) => true);
  }

  Future<void> signUp() async {
    final state = widget.controller.value;

    if (state is! AuthLoaded) {
      return;
    }

    widget.controller.signUp(
      email: state.emailController.text,
      password: state.passwordController.text,
      confirmPassword: state.confirmPasswordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (_, state, __) {
          if (state is AuthLoaded) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 96.width),
                  Expanded(
                    child: PageView(
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: widget.controller.changePage,
                      children: [
                        AuthFormSignInWidget(
                          onForgotPassword: () {},
                          onSubmit: signIn,
                        ),
                        AuthFormSignUpWidget(
                          emailController: state.emailController,
                          passwordController: state.passwordController,
                          confirmPasswordController:
                              state.confirmPasswordController,
                          acceptTerms: state.acceptTerms,
                          onAcceptTermsChanged:
                              widget.controller.toggleAcceptTerms,
                          onSubmit: signUp,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.width,
                      vertical: 16.height,
                    ),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.width),
                          child: const Text(
                            'Ou Entre com',
                          ),
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.width,
                      vertical: 16.height,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SignInProviderButton(),
                        SizedBox(
                          width: 16.width,
                        ),
                        const SignInProviderButton(),
                      ],
                    ),
                  ),
                  const Text(
                    'Não possui conta? Criar conta.',
                  ),
                  SizedBox(
                    height: 16.height,
                  ),
                  const Text(
                    'Ao continuar, confirmo que li e aceito os termos de uso, condições e a Política de Privacidade',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16.height,
                  ),
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

class SignInProviderButton extends StatelessWidget {
  const SignInProviderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      child: SizedBox(
        width: 60.width,
        height: 60.height,
      ),
    );
  }
}
