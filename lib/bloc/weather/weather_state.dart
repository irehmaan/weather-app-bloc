// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

enum Status { initial, fetching, loaded, error }

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {
  final Status status;
  WeatherInitial({
    this.status = Status.initial,
  });
}

class WeatherDataLoaded extends WeatherState {
  final Status? status;
  final WeatherData? weatherData;
  WeatherDataLoaded({
    this.status,
    this.weatherData,
  });

  @override
  List<Object?> get props => [weatherData, status];
}

class WeatherDataError extends WeatherState {
  final Status status;
  final String errMessage;
  WeatherDataError({
    required this.status,
    required this.errMessage,
  });
  @override
  List<Object> get props => [errMessage, status];
}
