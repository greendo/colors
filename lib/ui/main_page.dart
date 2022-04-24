import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:random_colors/bloc/color_cubit.dart';

/// Main screen
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, Color>(
      builder: (context, computedBackgroundColor) => Scaffold(
        backgroundColor: computedBackgroundColor,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.colorsText),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<ColorCubit>().newColor();
          },
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.centerText,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: computedBackgroundColor.computeLuminance() < 0.5
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
