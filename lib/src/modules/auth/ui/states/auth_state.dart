import 'package:flutter/material.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  AuthLoaded({
    required this.currentPage,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.acceptTerms,
  });

  final int currentPage;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool acceptTerms;

  AuthLoaded copyWith({
    int? currentPage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    bool? acceptTerms,
  }) {
    return AuthLoaded(
      currentPage: currentPage ?? this.currentPage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      acceptTerms: acceptTerms ?? this.acceptTerms,
    );
  }
}

class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
}
