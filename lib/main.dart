import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:random_colors/bloc/color_cubit.dart';
import 'package:random_colors/ui/main_page.dart';

void main() {
  runApp(Main());
}

/// My App main class
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ColorCubit>(
        create: (_) => ColorCubit(),
        child: MainPage(),
      ),
    );
  }
}
