import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: '',
  primaryColor: const Color(0xFFFFFFFF),
  secondaryHeaderColor: const Color(0xFF009f67),
  disabledColor: const Color(0xffa2a7ad),
  brightness: Brightness.dark,
  hintColor: const Color(0xffd1d0d0),
  cardColor: const Color(0xFF000000),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: const Color(0xFF256439))),
  colorScheme: const ColorScheme.dark(primary: Color(0xFF256439),
      tertiary: Color(0xff6165D7),
      tertiaryContainer: Color(0xff171DB6),
      secondary: Color(0xFFFF8200)).copyWith(surface: const Color(0xFF191A26)).copyWith(error: const Color(0xFFdd3135)),
  popupMenuTheme: const PopupMenuThemeData(color: Color(0xFF29292D), surfaceTintColor: Color(0xFF29292D)),
  dialogTheme: const DialogTheme(surfaceTintColor: Colors.white10),
  floatingActionButtonTheme: FloatingActionButtonThemeData(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(500))),
  bottomAppBarTheme: const BottomAppBarTheme(
    surfaceTintColor: Colors.black, height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
  ),
  dividerTheme: const DividerThemeData(thickness: 0.5, color: Color(0xFFA0A4A8)),
);
