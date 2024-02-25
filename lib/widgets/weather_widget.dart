import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:timezone/timezone.dart' as tz;
import '../bloc/weather/weather_bloc.dart';
import '../model/weather_model.dart';

class WeatherDataUi extends StatelessWidget {
  const WeatherDataUi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitial) {
          return CircularProgressIndicator();
        }
        if (state is WeatherDataLoaded) {
          print(state.weatherData.runtimeType);
          final weatherData = state.weatherData;

          return _buildWeatherDataView(weatherData!);
        }
        if (state is WeatherDataError) {
          return Text("Something went wrong....");
        }
        return CircularProgressIndicator(); // Show loading indicator by default
      },
    );
  }
}

Widget _buildWeatherDataView(WeatherData weatherData) {
  String formatDateTime(DateTime dateTime, String timeZone) {
    final location = tz.getLocation(timeZone);
    final formattedDateTime = tz.TZDateTime.from(dateTime, location);
    return DateFormat('HH:mm:ss').format(formattedDateTime);
  }

  /*
  This renders the weather UI shown on homescreem
  and we are shwowing animation acc. to the main weather conditon
  passed from our weather data model.
  */
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/weather_icons/sunny.json';
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'dust':
      case 'haze':
      case 'mist':
        return 'assets/weather_icons/mist.json';
      case 'fog':
        return 'assets/weather_icons/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/weather_icons/thunderstorm.json';
      case 'clear':
        return 'assets/weather_icons/sunny.json';
      case 'thunderstorm':
        return 'assets/weather_icons/thunder.json';
      default:
        return 'assets/weather_icons/sunny.json';
    }
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //     boxShadow: [
          //   BoxShadow(
          //       color: Colors.grey.shade200,
          //       blurRadius: 100,
          //       offset: Offset(-1, -1)),
          //   BoxShadow(
          //       color: Colors.grey.shade400.withOpacity(0.8),
          //       blurRadius: 100,
          //       offset: Offset(1, 1))
          // ]
        ),
        child: Lottie.asset(
          getWeatherAnimation(weatherData.mainWeatherCondition),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          " ${weatherData.weatherDescription}",
          style: TextStyle(fontSize: 14),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            Text(
              " ${weatherData.locationName}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${weatherData.temperatureCelsius.toStringAsFixed(0)} °C",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              " ${weatherData.mainWeatherCondition}",
            ),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                'Sunrise: ${formatDateTime(weatherData.sunrise, 'Asia/Kolkata')}'),
            Text(
                'Sunset: ${formatDateTime(weatherData.sunset, 'Asia/Kolkata')}'),
            // Text('Sunset: ${weatherData.sunset}'),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
                Text(
                    "Feels like: ${weatherData.feelsLikeCelsius.toStringAsFixed(0)}"),
                Text("Visbility:  ${weatherData.visibility / 1000} m "),
                Text("humidity: ${weatherData.humidity} %"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
                Text(
                    "Wind Speed: ${weatherData.windSpeed.toStringAsFixed(0)} m/s"),
                Text("Wind Gust:  ${weatherData.windGust} m/s "),
                Text("Wind Direction: ${weatherData.windDirection} ॰ "),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
