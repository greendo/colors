import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_colors/bloc/color_cubit.dart';
import 'package:random_colors/ui/main_page.dart';

void main() {
  testWidgets('Emails has a title and tappable button',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
        home: BlocProvider<ColorCubit>(
          create: (_) => ColorCubit(),
          child: MainPage(),
        ),
      ),
    );

    /** AppBar title present */
    expect(find.text("Colors"), findsOneWidget);
    /** Center text present */
    expect(find.text("Hey there"), findsOneWidget);
    /** Background color on init is white */
    expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        Colors.white,
    );

    /** Imitate background tap */
    await tester.tap(find.byType(GestureDetector));
    /** Rebuild the widget after the state has changed */
    await tester.pumpAndSettle();
    /** Background color after tap should not be white.
     * There is a slight chance, that generated color might be white,
     * so this part of a test might as well be skipped.*/
    expect(
        (tester.firstWidget(find.byType(Scaffold)) as Scaffold).backgroundColor,
        isNot(Colors.white),
    );
  });
}
