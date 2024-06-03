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
    required this.borderRadius,
    required this.labelStyle,
    required this.placeholderStyle,
    required this.errorStyle,
    required this.bottomNavigationTextStyle,
  });

  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color onTertiaryContainerColor;
  final Color errorColor;
  final Color tertiary;
  final Color onSecondaryContainer;
  final Color onPrimary;
  final int borderRadius;
  final TextStyle labelStyle;
  final TextStyle placeholderStyle;
  final TextStyle errorStyle;
  final TextStyle bottomNavigationTextStyle;

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
    int? borderRadius,
    TextStyle? labelStyle,
    TextStyle? placeholderStyle,
    TextStyle? errorStyle,
    TextStyle? bottomNavigationTextStyle,
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
      borderRadius: borderRadius ?? this.borderRadius,
      labelStyle: labelStyle ?? this.labelStyle,
      placeholderStyle: placeholderStyle ?? this.placeholderStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      bottomNavigationTextStyle: bottomNavigationTextStyle ?? this.bottomNavigationTextStyle,
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
      borderRadius: (borderRadius + (other.borderRadius - borderRadius) * t).toInt(),
      labelStyle: TextStyle.lerp(labelStyle, other.labelStyle, t)!,
      placeholderStyle: TextStyle.lerp(placeholderStyle, other.placeholderStyle, t)!,
      errorStyle: TextStyle.lerp(errorStyle, other.errorStyle, t)!,
      bottomNavigationTextStyle: TextStyle.lerp(bottomNavigationTextStyle, other.bottomNavigationTextStyle, t)!,
    );
  }
}
