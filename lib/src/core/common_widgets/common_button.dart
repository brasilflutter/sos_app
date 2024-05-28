import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utilities/responsive.dart';

class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    required this.backgroundColor,
    required this.label,
    required this.textStyle,
    required this.height,
    required this.width,
    Key? key,
    this.borderRadius = 31,
    this.onTap,
    this.icon,
    this.padding = const EdgeInsets.all(8),
    this.isLoading = false,
    this.circularSize = 20,
    this.circularColor = Colors.white,
    this.outlined = false,
    this.borderSize = 1,
    this.borderColor = Colors.transparent,
    this.iconSvg,
    this.iconSize,
  }) : super(key: key);
  final Color backgroundColor;
  final double borderRadius;
  final String label;
  final TextStyle textStyle;
  final Function()? onTap;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final bool isLoading;
  final double circularSize;
  final Color circularColor;
  final IconData? icon;
  final bool outlined;
  final double borderSize;
  final Color borderColor;
  final String? iconSvg;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: isLoading ? null : onTap,
          child: Ink(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: outlined
                  ? Border.all(
                      color: borderColor,
                      width: borderSize,
                    )
                  : null,
            ),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: circularSize.height,
                      width: circularSize.width,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(circularColor),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          Icon(
                            icon,
                            color: textStyle.color,
                          ),
                          SizedBox(width: 10.width),
                        ],
                        if (iconSvg != null) ...[
                          SvgPicture.asset(
                            iconSvg!,
                            height: iconSize,
                            width: iconSize,
                            colorFilter: ColorFilter.mode(textStyle.color ?? Colors.black, BlendMode.srcIn),
                          ),
                          SizedBox(width: 10.width),
                        ],
                        FittedBox(
                          child: Text(
                            label,
                            maxLines: 2,
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
