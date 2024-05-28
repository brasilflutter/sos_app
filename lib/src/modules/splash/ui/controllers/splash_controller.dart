import 'package:sos_app/src/modules/splash/ui/states/splash_state.dart';
import 'package:sos_app/src/utilities/base_controller.dart';

class SplashController extends BaseController<SplashState> {
  SplashController() : super(SplashInitial());

  @override
  void init() {
    emit(SplashLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(SplashLoaded());
    });
  }
}
