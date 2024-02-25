import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather/weather_bloc.dart';
import '../widgets/weather_widget.dart';

class SearchWeatherScreen extends StatelessWidget {
  const SearchWeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String city = '';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade200.withOpacity(0.7),
          centerTitle: true,
          title: TextField(
            onSubmitted: (value) {
              BlocProvider.of<WeatherBloc>(context).add(LoadingState());
              BlocProvider.of<WeatherBloc>(context)
                  .add(FetchWeatherData(city: value));
              city = value;
            },
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText: 'Search by location e.g. Delhi',
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherDataLoaded) {
                return Column(
                  children: [
                    Text(
                      city.isEmpty ? '' : "showing results for $city",
                      style: TextStyle(fontSize: 20),
                    ),
                    WeatherDataUi(),
                  ],
                );
              } else if (state is WeatherInitial) {
                return Center(child: CircularProgressIndicator());
              } else if (state is WeatherDataError) {
                return Center(
                  child: Text('Error: ${state.errMessage}'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
