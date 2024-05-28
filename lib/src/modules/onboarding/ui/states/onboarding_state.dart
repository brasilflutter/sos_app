import '../viewmodels/onboarding.dart';

class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingLoading extends OnboardingState {}

class OnboardingLoaded extends OnboardingState {
  OnboardingLoaded({
    required this.sliders,
    this.currentIndex = 0,
  });
  final List<OnBoardingViewModel> sliders;
  final int currentIndex;

  OnboardingLoaded copyWith({
    List<OnBoardingViewModel>? sliders,
    int? currentIndex,
  }) {
    return OnboardingLoaded(
      sliders: sliders ?? this.sliders,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

class OnboardingError extends OnboardingState {
  OnboardingError(this.message);
  final String message;
}
