import '../../../../app/theme/app_assets.dart';
import '../../../../utilities/templates/base_controller.dart';
import '../states/onboarding_state.dart';
import '../viewmodels/onboarding.dart';

class OnboadingController extends BaseController<OnboardingState> {
  OnboadingController() : super(OnboardingInitial());

  @override
  Future<void> init() async{
    emit(OnboardingLoading());

    final sliders = [
      OnBoardingViewModel(
        text: '',
        imagePath: AppAssets.logo,
      ),
      OnBoardingViewModel(
        text: 'Aqui você pode cadastrar animais desaparecidos',
        imagePath: AppAssets.onboardingImage2,
      ),
      OnBoardingViewModel(
        text: 'Cadastrar abrigos de animais desaparecidos',
        imagePath: AppAssets.onboardingImage3,
      ),
      OnBoardingViewModel(
        text: 'E localizar animais desaparecidos pelo microchip ou biometria facial',
        imagePath: AppAssets.onboardingImage4,
      ),
    ];

    emit(OnboardingLoaded(sliders: sliders));
  }

  void onChangeIndex(int index) {
    final oldState = currentState;
    if (oldState is OnboardingLoaded) {
      final state = oldState;
      emit(state.copyWith(currentIndex: index));
    }
  }
}
