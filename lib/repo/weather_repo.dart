import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/weather_model.dart';

class WeatherService {
  Future<WeatherData> getWeatherData(
      {required double lat, required double long, String? city}) async {
    final Dio dio = Dio();
    String url = '';
    String apiKey = dotenv.env['OPENWEATHER_API_KEY']!;

    try {
      final Response response = await dio.get(url, queryParameters: {
        'q': city,
        'lat': lat,
        'lon': long,
        'appid': apiKey,
      });

      if (response.statusCode == 200) {
        return WeatherData.fromJson(response.data);
      } else {
        throw Exception('Failed to get weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
