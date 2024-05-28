import 'package:flutter/material.dart';

import '../../viewmodels/onboarding.dart';
import 'onboarding.dart';

class OnboardingSlidersWidget extends StatelessWidget {
  const OnboardingSlidersWidget({
    required this.currentIndex,
    required this.onPageChanged,
    required this.sliders,
    super.key,
  });

  final int currentIndex;
  final Function(int) onPageChanged;
  final List<OnBoardingViewModel> sliders;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: sliders.length,
        onPageChanged: onPageChanged,
        itemBuilder: (_, index) {
          final slide = sliders[index];
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: currentIndex == index ? 1 : 0,
            child: OnboardingWidget(
              text: slide.text,
              imagePath: slide.imagePath,
            ),
          );
        },
      ),
    );
  }
}
