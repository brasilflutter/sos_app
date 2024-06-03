import 'package:flutter/material.dart';

import '../../app/theme/extensions/sos_app_theme.dart';
import '../../utilities/extensions/build_context.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.isSecure = false,
    this.autocorrect = false,
  });
  final String? label;
  final String? placeholder;
  final TextEditingController? controller;
  final bool isSecure;
  final bool autocorrect;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool isSecure = false;
  @override
  void initState() {
    super.initState();
    isSecure = widget.isSecure;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.getExtension<SosAppThemeExtension>();
    return TextFormField(
      controller: widget.controller,
      autocorrect: widget.autocorrect,
      obscureText: isSecure,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        hintText: widget.placeholder,
        hintStyle: theme.placeholderStyle,
        suffixIcon: widget.isSecure
            ? IconButton(
                icon: Icon(
                  isSecure ? Icons.visibility_outlined : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              )
            : null,
        labelStyle: theme.labelStyle,
      ),
    );
  }
}
