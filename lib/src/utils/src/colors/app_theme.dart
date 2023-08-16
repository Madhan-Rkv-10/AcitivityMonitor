import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    useMaterial3: true,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: const Color(0xffF5F5F5),
    cardColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      iconTheme: IconThemeData(
        color: Colors.purple,
      ),
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
          fontSize: 40, fontWeight: FontWeight.normal, color: Colors.black),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      bodyLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    cardColor: Colors.grey.withOpacity(0.5),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.purple,
      iconTheme: IconThemeData(
        color: Colors.purple,
      ),
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      bodyLarge: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    ),
  );
}
