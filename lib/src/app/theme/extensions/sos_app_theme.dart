import 'package:flutter/material.dart';

class SosAppThemeExtension extends ThemeExtension<SosAppThemeExtension> {
  SosAppThemeExtension({
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.onTertiaryContainerColor,
    required this.errorColor,
    required this.tertiary,
    required this.onSecondaryContainer,
    required this.onPrimary,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color onTertiaryContainerColor;
  final Color errorColor;
  final Color tertiary;
  final Color onSecondaryContainer;
  final Color onPrimary;

  @override
  ThemeExtension<SosAppThemeExtension> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? backgroundColor,
    Color? onTertiaryContainerColor,
    Color? errorColor,
    Color? tertiary,
    Color? onSecondaryContainer,
    Color? onPrimary,
  }) {
    return SosAppThemeExtension(
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onTertiaryContainerColor: onTertiaryContainerColor ?? this.onTertiaryContainerColor,
      errorColor: errorColor ?? this.errorColor,
      tertiary: tertiary ?? this.tertiary,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      onPrimary: onPrimary ?? this.onPrimary,
    );
  }

  @override
  ThemeExtension<SosAppThemeExtension> lerp(SosAppThemeExtension? other, double t) {
    return SosAppThemeExtension(
      primaryColor: Color.lerp(primaryColor, other!.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      onTertiaryContainerColor: Color.lerp(onTertiaryContainerColor, other.onTertiaryContainerColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onSecondaryContainer: Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
    );
  }
}
