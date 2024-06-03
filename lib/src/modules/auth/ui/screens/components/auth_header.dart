// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../../app/theme/extensions/sos_app_theme.dart';
import '../../../../../app/theme/font_manager.dart';
import '../../../../../utilities/extensions/build_context.dart';
import '../../../../../utilities/extensions/responsive.dart';

class AuthHeaderWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  const AuthHeaderWidget({
    required this.title,
    this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return Column(
      children: [
        Text(
          title,
          style: getSemiBoldStyle(
            color: theme.primaryColor,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 8.width),
        if (subTitle != null)
          Text(
            subTitle!,
            style: getSemiBoldStyle(
              color: theme.tertiary,
              fontSize: 16.sp,
            ),
          ),
      ],
    );
  }
}
