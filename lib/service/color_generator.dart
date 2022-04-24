import 'dart:math';

import 'package:flutter/material.dart';

/// Color generator class
class ColorGenerator {
  final _rand = Random();
  final _maxInt = 255;
  static final ColorGenerator _singleton = ColorGenerator._internal();

  /// Singleton constructor
  factory ColorGenerator() {
    return _singleton;
  }

  ColorGenerator._internal();

  /// generate new color
  Color generateRandomColor() {
    return Color.fromARGB(_r(), _r(), _r(), _r());
  }

  int _r() => _rand.nextInt(_maxInt);
}
