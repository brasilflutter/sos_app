// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingWidget extends StatelessWidget {
  final String text;
  final String imagePath;
  const OnboardingWidget({
    required this.text,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        imagePath,
      ),
    );
  }
}
