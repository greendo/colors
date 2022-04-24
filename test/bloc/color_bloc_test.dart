import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:random_colors/bloc/color_cubit.dart';

void main() {
  blocTest<ColorCubit, Color>(
    'on creation ColorCubit emits nothing',
    build: () => ColorCubit(),
    expect: () => <Color>[],
  );
}
