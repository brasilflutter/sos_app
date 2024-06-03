import 'package:flutter/material.dart';

import 'extensions/sos_app_theme.dart';
import 'font_manager.dart';

class AppTheme {
  AppTheme._();
  static final instance = AppTheme._();
  final Color _primaryColor = const Color(0xffF25C5C);
  final Color _secondaryColor = const Color(0xff465952);
  final Color _backgroundColor = const Color(0xffF2F2F0);
  final Color _onTertiaryContainerColor = const Color(0xffF2A9A2);
  final Color _errorColor = const Color(0xffF24444);
  final Color _tertiary = const Color(0xff373737);
  final Color _onSecondaryContainer = const Color(0xff838383);
  final Color _onPrimary = const Color(0xffFFFFFF);
  ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      extensions: [
        SosAppThemeExtension(
          primaryColor: _primaryColor,
          secondaryColor: _secondaryColor,
          backgroundColor: _backgroundColor,
          onTertiaryContainerColor: _onTertiaryContainerColor,
          errorColor: _errorColor,
          tertiary: _tertiary,
          onSecondaryContainer: _onSecondaryContainer,
          onPrimary: _onPrimary,
          borderRadius: 8,
          labelStyle: getSemiBoldStyle(
            fontSize: 16,
            color: _tertiary,
          ),
          placeholderStyle: getRegularStyle(
            fontSize: 16,
            color: _onSecondaryContainer,
          ),
          errorStyle: getRegularStyle(
            fontSize: 14,
            color: _errorColor,
          ),
          bottomNavigationTextStyle: getRegularStyle(
            color: _tertiary,
            height: 2,
          ),
        ),
      ],
    );
  }
}
