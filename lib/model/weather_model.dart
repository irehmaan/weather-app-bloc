class WeatherData {
  final double longitude;
  final double latitude;

  final String mainWeatherCondition;
  final String weatherDescription;
  final String weatherIcon;

  final double temperatureCelsius;
  final double feelsLikeCelsius;
  final double minTemperatureCelsius;
  final double maxTemperatureCelsius;

  final int pressure;
  final int humidity;

  final double windSpeed;
  final int windDirection;
  final double windGust;

  final int cloudiness;
  final int visibility;

  final DateTime sunrise;
  final DateTime sunset;

  final String country;
  final String locationName;

  WeatherData({
    required this.longitude,
    required this.latitude,
    required this.mainWeatherCondition,
    required this.weatherDescription,
    required this.weatherIcon,
    required this.temperatureCelsius,
    required this.feelsLikeCelsius,
    required this.minTemperatureCelsius,
    required this.maxTemperatureCelsius,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
    required this.windGust,
    required this.cloudiness,
    required this.visibility,
    required this.sunrise,
    required this.sunset,
    required this.country,
    required this.locationName,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      longitude: json['coord']['lon'],
      latitude: json['coord']['lat'],
      mainWeatherCondition: json['weather'][0]['main'],
      weatherDescription: json['weather'][0]['description'],
      weatherIcon: json['weather'][0]['icon'],
      temperatureCelsius: json['main']['temp'] - 273.15,
      feelsLikeCelsius: json['main']['feels_like'] - 273.15,
      minTemperatureCelsius: json['main']['temp_min'] - 273.15,
      maxTemperatureCelsius: json['main']['temp_max'] - 273.15,
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'],
      windDirection: json['wind']['deg'],
      windGust: json['wind']['gust'] ?? 0,
      cloudiness: json['clouds']['all'],
      visibility: json['visibility'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(
          json['sys']['sunrise'] * 1000,
          isUtc: true),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000,
          isUtc: true),
      country: json['sys']['country'],
      locationName: json['name'],
    );
  }
}
