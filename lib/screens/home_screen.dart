import 'package:flutter/material.dart';
import '../widgets/current_location.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CustomAppBar(), CurrentLocation(), WeatherDataUi()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
