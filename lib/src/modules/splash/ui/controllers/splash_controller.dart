import '../../../../app/app_routes.dart';
import '../../../../utilities/templates/base_controller.dart';
import '../states/splash_state.dart';

class SplashController extends BaseController<SplashState> {
  SplashController() : super(SplashInitial());

  @override
  void init() {
    emit(SplashLoading());
    Future.delayed(const Duration(seconds: 3), () {
      emit(SplashLoaded(route: AppRoutes.onboarding.path));
    });
  }
}
