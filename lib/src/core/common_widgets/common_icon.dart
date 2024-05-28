// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CommonIconWidget extends StatefulWidget {
  final String pathSvg;
  final double? width;
  final double? height;
  final Color? color;
  const CommonIconWidget({
    required this.pathSvg,
    super.key,
    this.width,
    this.height,
    this.color,
  });

  @override
  State<CommonIconWidget> createState() => _CommonIconWidgetState();
}

class _CommonIconWidgetState extends State<CommonIconWidget> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.pathSvg,
      width: widget.width,
      height: widget.height,
      colorFilter: widget.color != null
          ? ColorFilter.mode(
              widget.color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
