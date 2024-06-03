// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../viewmodels/auth.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  AuthLoaded({
    required this.viewModel,
    required this.currentPage,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.acceptTerms,
    required this.viewModels,
  });

  final AuthViewModel viewModel;
  final int currentPage;
  final TextEditingController emailController ;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool acceptTerms;
  final List<AuthViewModel> viewModels;

  AuthLoaded copyWith({
    AuthViewModel? viewModel,
    int? currentPage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    bool? acceptTerms,
    List<AuthViewModel>? viewModels,
  }) {
    return AuthLoaded(
      viewModel: viewModel ?? this.viewModel,
      currentPage: currentPage ?? this.currentPage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController: confirmPasswordController ?? this.confirmPasswordController,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      viewModels: viewModels ?? this.viewModels,
    );
  }
}

class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
}
