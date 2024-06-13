import 'package:flutter/material.dart';

import '../../../../utilities/templates/base_controller.dart';
import '../../domain/auth_repository.dart';
import '../../domain/entities/sign_in_params_entity.dart';
import '../../domain/entities/sign_up_params_entity.dart';
import '../states/auth_state.dart';

class AuthController extends BaseController<AuthState> {
  AuthController(
    this.authRepository,
  ) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    authRepository.signInWithEmailAndPassword(
      SignInParamsEntity(email: email, password: password),
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    authRepository.signUpWithEmailAndPassword(
      SignUpParamsEntity(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<void> init() async {
    emit(
      AuthLoaded(
        currentPage: 0,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        acceptTerms: false,
      ),
    );
  }

  void changePage(int index) {
    final state = currentState;
    if (state is AuthLoaded) {
      emit(
        state.copyWith(
          currentPage: index,
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
