part of 'location_bloc.dart';

// Events
abstract class LocationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetLocationEvent extends LocationEvent {}
