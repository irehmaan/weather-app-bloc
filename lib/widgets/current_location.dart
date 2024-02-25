import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/location/location_bloc.dart';
import '../bloc/weather/weather_bloc.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state is LocationInitial) {
          BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
          return Container();
        } else if (state is LocationLoaded) {
          context.read<WeatherBloc>().add(FetchWeatherData(
              latitude: state.location.latitude,
              longitude: state.location.longitude));
          return Container();
        } else if (state is LocationError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('Unknown state.'));
        }
      },
    );
  }
}
