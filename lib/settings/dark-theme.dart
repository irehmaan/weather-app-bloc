import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(primary: Colors.black),
    useMaterial3: true,
    navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
        labelTextStyle:
            MaterialStatePropertyAll(TextStyle(color: Colors.black))),
    appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey[900],
        titleTextStyle: const TextStyle(color: Colors.white)),
    scaffoldBackgroundColor: Colors.grey.shade900,
    listTileTheme: const ListTileThemeData(
        subtitleTextStyle: TextStyle(color: Colors.white),
        textColor: Colors.white,
        iconColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white),
        tileColor: Colors.black),
    iconTheme: const IconThemeData(color: Colors.white),
    drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[900], scrimColor: Colors.transparent),
    sliderTheme: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        activeTrackColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade700),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all(Colors.white),
      thumbColor: MaterialStateProperty.all(Colors.black),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Colors.white),
    )),
    inputDecorationTheme:
        const InputDecorationTheme(hintStyle: TextStyle(color: Colors.white)),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(color: Colors.white),
        headlineMedium: TextStyle(color: Colors.white),
        headlineSmall: TextStyle(color: Colors.white),
        titleLarge: TextStyle(color: Colors.white),
        titleMedium: TextStyle(color: Colors.white),
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
        displaySmall: TextStyle(color: Colors.white),
        displayLarge: TextStyle(color: Colors.white),
        labelLarge: TextStyle(color: Colors.white),
        labelMedium: TextStyle(color: Colors.white),
        labelSmall: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.white)));
