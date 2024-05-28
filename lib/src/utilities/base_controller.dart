import 'package:flutter/material.dart';

abstract class BaseController<T> extends ValueNotifier<T> {
  BaseController(super.state);

  T get currentState => value;

  void init();

  void emit(T state) {
    if (hasListeners) {
      value = state;
    }
  }
}
