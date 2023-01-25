// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:wordpress_flutter/core/res/colors.dart';
import 'package:wordpress_flutter/core/res/dimensions.dart';

class AppTheme {
  static ThemeData theme({bool isDark = false}) => ThemeData(
        // useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
            brightness: isDark ? Brightness.dark : Brightness.light,
            primarySwatch: AppColors.primarySwatch,
            accentColor: AppColors.primarySwatch),
        toggleableActiveColor: AppColors.primarySwatch,
        // scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        indicatorColor: AppColors.primarySwatch,
        appBarTheme: AppBarTheme(
          // elevation: 0,
          centerTitle: false,
          foregroundColor: isDark ? Colors.white : Colors.black,
        ),
        // textTheme: textTheme,
        buttonTheme: buttonTheme,
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.xs)),
        ),
        elevatedButtonTheme: elevatedButtonTheme,
        textButtonTheme: textButtonTheme,
        outlinedButtonTheme: outlinedButtonThemeData,
        inputDecorationTheme: InputDecorationTheme(
            errorMaxLines: 2,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.s),
            ),
            alignLabelWithHint: true),
        bottomNavigationBarTheme: bottomNavigationBarTheme,
      );

  static BottomNavigationBarThemeData bottomNavigationBarTheme =
      BottomNavigationBarThemeData(
    elevation: 4,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.primarySwatch,
    unselectedItemColor: AppColors.darkGrey,
    showSelectedLabels: true,
    showUnselectedLabels: true,
  );

  static ButtonThemeData buttonTheme = const ButtonThemeData(
    padding: EdgeInsets.only(
        top: AppDimens.m,
        bottom: AppDimens.m,
        left: AppDimens.m,
        right: AppDimens.m),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.only(
        top: AppDimens.m,
        bottom: AppDimens.m,
        left: AppDimens.m,
        right: AppDimens.m),
  ));
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.only(
        top: AppDimens.m,
        bottom: AppDimens.m,
        left: AppDimens.m,
        right: AppDimens.m),
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        width: 0.0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(AppDimens.xs)),
    ),
  ));

  static OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    side: BorderSide(color: AppColors.primarySwatch),
    padding: const EdgeInsets.only(
        top: AppDimens.m,
        bottom: AppDimens.m,
        left: AppDimens.m,
        right: AppDimens.m),
  ));

  static ButtonStyle greenElevatedButton() {
    return ElevatedButton.styleFrom(backgroundColor: AppColors.green);
  }

  static ButtonStyle darkGreyElevatedButton() {
    return ElevatedButton.styleFrom(backgroundColor: AppColors.darkGrey);
  }
}
