class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {}

class SplashError extends SplashState {
  final String message;

  SplashError(this.message);
}