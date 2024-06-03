import 'package:flutter/material.dart';

import '../../../../utilities/templates/base_controller.dart';
import '../states/auth_state.dart';
import '../viewmodels/auth.dart';

class AuthController extends BaseController<AuthState> {
  AuthController() : super(AuthInitial());

  Future<void> signIn({
    required String email,
    required String password,
  }) async {}

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {}

  @override
  Future<void> init() async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));
    final viewmodels = [
      AuthViewModel(
        title: 'Login',
        subTitle: 'Seja bem vindo!',
      ),
      AuthViewModel(
        title: 'Criar conta',
      ),
    ];
    emit(
      AuthLoaded(
        currentPage: 0,
        viewModel: viewmodels[0],
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        acceptTerms: false,
        viewModels: viewmodels,
      ),
    );
  }

  void changePage(int index) {
    final state = currentState;
    if (state is AuthLoaded) {
      emit(
        state.copyWith(
          currentPage: index,
          viewModel: state.viewModels[index],
        ),
      );
    }
  }

  void toggleAcceptTerms(bool value) {
    final state = currentState;
    if (state is AuthLoaded) {
      emit(
        state.copyWith(
          acceptTerms: value,
        ),
      );
    }
  }
}
