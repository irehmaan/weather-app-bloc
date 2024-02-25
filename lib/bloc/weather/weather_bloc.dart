import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../model/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final Dio _dio = Dio();
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeatherData>((event, emit) async {
      try {
        final _apiKey = '38f80bcc6aa70705733e69ba245a7798';
        final Response response = await _dio.get(
            'https://api.openweathermap.org/data/2.5/weather',
            queryParameters: {
              'q': event.city,
              'lat': event.latitude,
              'lon': event.longitude,
              'appid': _apiKey
            });

        emit(WeatherDataLoaded(
            status: Status.loaded,
            weatherData: WeatherData.fromJson(response.data)));
      } catch (e) {
        emit(WeatherDataError(status: Status.error, errMessage: e.toString()));
      }
    });
    on<LoadingState>((event, emit) {
      emit(WeatherInitial());
    });
  }
}
