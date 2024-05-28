class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  SplashLoaded({required this.route});
  final String route;
}

class SplashError extends SplashState {
  SplashError(this.message);
  final String message;
}
