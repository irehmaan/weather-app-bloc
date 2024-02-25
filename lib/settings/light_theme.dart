import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(primary: Colors.white),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black)),
    scaffoldBackgroundColor: Colors.grey.shade200.withOpacity(0.7),
    iconTheme: const IconThemeData(color: Colors.black),
    listTileTheme: ListTileThemeData(
      subtitleTextStyle: const TextStyle(color: Colors.black),
      textColor: Colors.black,
      iconColor: Colors.black,
      titleTextStyle: const TextStyle(color: Colors.black),
      tileColor: Colors.grey.shade700,
    ),
    inputDecorationTheme:
        const InputDecorationTheme(hintStyle: TextStyle(color: Colors.black)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0, backgroundColor: Colors.grey.shade400),
    sliderTheme: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.black),
    drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        scrimColor: Colors.black.withOpacity(0.2)),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.black),
    )),
    switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(Colors.black),
        thumbColor: MaterialStateProperty.all(Colors.white)),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(color: Colors.black),
        headlineMedium: TextStyle(color: Colors.black),
        headlineSmall: TextStyle(color: Colors.black),
        titleLarge: TextStyle(color: Colors.black),
        titleMedium: TextStyle(color: Colors.black),
        titleSmall: TextStyle(color: Colors.black),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        displaySmall: TextStyle(color: Colors.black),
        displayLarge: TextStyle(color: Colors.black),
        labelLarge: TextStyle(color: Colors.black),
        labelMedium: TextStyle(color: Colors.black),
        labelSmall: TextStyle(color: Colors.black),
        displayMedium: TextStyle(color: Colors.black)));
