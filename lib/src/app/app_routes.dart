enum AppRoutes {
  splash(path: '/'),
  onboarding(path: '/onboarding');

  const AppRoutes({required this.path});
  final String path;
}
