// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class LoadingState extends WeatherEvent {}

class FetchWeatherData extends WeatherEvent {
  final double? latitude;
  final double? longitude;
  final String? city;
  FetchWeatherData({
    this.latitude,
    this.longitude,
    this.city,
  });

  @override
  List<Object?> get props => [city, latitude, longitude];

  @override
  String toString() =>
      'FetchWeatherData(latitude: $latitude, longitude: $longitude, city: $city)';
}
