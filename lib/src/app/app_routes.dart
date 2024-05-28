enum AppRoutes {
  splash(path: '/'),
  onboarding(path: '/onboarding'),
  signIn(path: '/auth'),
  signUp(path: '/auth/sign-up');

  const AppRoutes({required this.path});
  final String path;
}
