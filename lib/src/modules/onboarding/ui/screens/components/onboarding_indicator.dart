import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';

class OnboardingIndicatorWidget extends StatefulWidget {
  const OnboardingIndicatorWidget({
    required this.currentIndex,
    required this.length,
    Key? key,
  }) : super(key: key);
  final int currentIndex;
  final int length;

  @override
  State<OnboardingIndicatorWidget> createState() => _OnboardingIndicatorWidgetState();
}

class _OnboardingIndicatorWidgetState extends State<OnboardingIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    final sosTheme = context.getExtension<SosAppThemeExtension>();
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
            color: widget.currentIndex == index ? sosTheme.primaryColor : null,
            borderRadius: BorderRadius.circular(10),
            border: widget.currentIndex == index
                ? null
                : Border.all(
                    color: sosTheme.primaryColor,
                    width: 2,
                  ),
          ),
        ),
      ),
    );
  }
}
