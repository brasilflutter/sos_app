// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../app/theme/app_colors.dart';
import '../../../../../utilities/extensions/responsive.dart';

class OnboardingIndicatorWidget extends StatefulWidget {
  final int currentIndex;
  final int length;
  const OnboardingIndicatorWidget({
    required this.currentIndex,
    required this.length,
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingIndicatorWidget> createState() => _OnboardingIndicatorWidgetState();
}

class _OnboardingIndicatorWidgetState extends State<OnboardingIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.all(4),
          width: 10.width,
          height: 10.width,
          decoration: BoxDecoration(
            color: widget.currentIndex == index ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: widget.currentIndex == index ? null : Border.all(color: AppColors.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
