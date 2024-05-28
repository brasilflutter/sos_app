// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/font_manager.dart';
import '../../../../core/common_widgets/common_button.dart';
import '../../../../utilities/responsive.dart';
import '../controlles/onboarding_controller.dart';
import '../states/onboarding_state.dart';
import 'components/onboarding_header.dart';
import 'components/onboarding_indicator.dart';
import 'components/onboarding_sliders.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    required this.controller,
    Key? key,
  }) : super(key: key);
  final OnboadingController controller;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (_, state, __) {
            if (state is OnboardingLoaded) {
              return Column(
                children: [
                  OnboardingHeaderWidget(
                    isInitial: state.currentIndex == 0,
                    onJump: () {},
                  ),
                  SizedBox(height: 55.width),
                  OnboardingSlidersWidget(
                    sliders: state.sliders,
                    currentIndex: state.currentIndex,
                    onPageChanged: widget.controller.onChangeIndex,
                  ),
                  SizedBox(height: 52.width),
                  CommonButtonWidget(
                    width: 380.width,
                    backgroundColor: AppColors.primaryColor,
                    height: 56.width,
                    label: state.currentIndex == 0 ? 'VAMOS COMEÇAR' : 'PRÓXIMO',
                    textStyle: getSemiBoldStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 64.width),
                  OnboardingIndicatorWidget(
                    currentIndex: state.currentIndex,
                    length: state.sliders.length,
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
