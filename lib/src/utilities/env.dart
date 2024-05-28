enum Env {
  prod(
    baseUrl: 'https://localhost/homolog',
    title: 'homolog',
  );

  static Env fromString(String env) {
    return Env.values.firstWhere(
      (e) => e.title == env,
      orElse: () => Env.prod,
    );
  }

  final String baseUrl;
  final String title;

  // ignore: sort_constructors_first
  const Env({
    required this.baseUrl,
    required this.title,
  });
}
