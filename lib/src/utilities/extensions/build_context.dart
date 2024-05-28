import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

extension BuildContextExtension on BuildContext? {
  void pop<T>({T? object}) {
    Modular.to.pop(object);
  }

  Future push(String routeName, {Object? params}) async {
    return Modular.to.pushNamed(routeName, arguments: params);
  }

  Future<dynamic> navigate(String routeName, {Object? params}) async {
    return Modular.to.navigate(
      routeName,
      arguments: params,
    );
  }

  T getExtension<T>() {
    return Theme.of(this!).extension<T>() as T;
  }

  T get<T extends Object>() {
    return Modular.get<T>();
  }
}
