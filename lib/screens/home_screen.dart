import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/location/location_bloc.dart';
import 'package:weatherapp/bloc/weather/weather_bloc.dart';
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
                children: [
                  CustomAppBar(),
                  TextButton(
                      onPressed: () {
                        // Get the current location using the LocationBloc
                        final locationState =
                            context.read<LocationBloc>().state;

                        if (locationState is LocationLoaded) {
                          final locationData = locationState.location;

                          // Dispatch the FetchWeatherData event with the location information
                          context.read<WeatherBloc>().add(FetchWeatherData(
                                latitude: locationData.latitude,
                                longitude: locationData.longitude,
                              ));
                        }
                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_pin),
                          Text("Get current location weather"),
                        ],
                      )),
                  CurrentLocation(),
                  WeatherDataUi()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
