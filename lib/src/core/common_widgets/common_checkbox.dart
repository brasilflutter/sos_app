// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../app/theme/extensions/sos_app_theme.dart';
import '../../utilities/extensions/build_context.dart';

class CommonCheckboxWidget extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  const CommonCheckboxWidget({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: value
              ? null
              : Border.all(
                  color: theme.primaryColor,
                ),
        ),
        alignment: Alignment.center,
        child: value
            ? Icon(
                Icons.check_box,
                color: theme.primaryColor,
              )
            : null,
      ),
    );
  }
}
