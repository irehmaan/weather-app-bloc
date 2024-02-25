// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'location_bloc.dart';

// States

abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final LocationData location;

  LocationLoaded(this.location);

  @override
  List<Object> get props => [location];
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);

  @override
  List<Object> get props => [message];
}
