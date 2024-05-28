import 'package:flutter/material.dart';

import 'extensions/sos_app_theme.dart';

abstract class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      extensions: [
        SosAppThemeExtension(
          primaryColor: const Color(0xffF25C5C),
          secondaryColor: const Color(0xff465952),
          backgroundColor: const Color(0xffF2F2F0),
          onTertiaryContainerColor: const Color(0xffF2A9A2),
          errorColor: const Color(0xffF24444),
          tertiary: const Color(0xff373737),
          onSecondaryContainer: const Color(0xff838383),
          onPrimary: const Color(0xffFFFFFF),
        ),
      ],
    );
  }
}
