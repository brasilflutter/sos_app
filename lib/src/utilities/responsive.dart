import 'package:flutter/widgets.dart';

const kBreakpoint = Size(428, 926);

extension Sizer on num {
  double get width {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    final sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.width / kBreakpoint.width);
  }

  double get height {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    final sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.height / kBreakpoint.height);
  }

  double get sp {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    final sizer = window.physicalSize / window.devicePixelRatio;
    return this * (sizer.width / kBreakpoint.width);
  }
}
