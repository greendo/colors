import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_colors/service/color_generator.dart';

/// Bloc cubit for color state
class ColorCubit extends Cubit<Color> {
  final ColorGenerator _generator = ColorGenerator();

  /// Constructor
  ColorCubit() : super(Colors.white);

  /// New color generator
  void newColor() => emit(_generator.generateRandomColor());
}
