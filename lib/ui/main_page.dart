import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_colors/bloc/color_cubit.dart';

/// Main screen
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations? strings = AppLocalizations.of(context);
    if (strings == null) throw Exception("Localized messages are null");
    const textContrast = 0.5;

    return BlocBuilder<ColorCubit, Color>(
      builder: (context, computedBackgroundColor) => Scaffold(
        backgroundColor: computedBackgroundColor,
        appBar: AppBar(
          title: Text(strings.colorsText),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<ColorCubit>().newColor();
          },
          child: Center(
            child: Text(
              strings.centerText,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: computedBackgroundColor.
                  computeLuminance() < textContrast
                      ? Colors.white
                      : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
