import 'package:flutter/material.dart';

import 'src/app/app_widget.dart';
import 'src/utilities/env.dart';

void main() {
  runApp(const AppWidget());
}

final env = Env.fromString(
  const String.fromEnvironment(
    'env',
    defaultValue: 'prod',
  ),
);
