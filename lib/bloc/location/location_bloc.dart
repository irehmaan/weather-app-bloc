import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final Location location = Location();
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>(_GetLocationToState);
  }

  Future<void> _GetLocationToState(
      GetLocationEvent event, Emitter<LocationState> emit) async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          emit(LocationError('Location services are disabled.'));
          return;
        }
      }
      PermissionStatus permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          emit(LocationError('Location permission denied.'));
          return;
        }
      }
      LocationData locationData = await location.getLocation();
      emit(LocationLoaded(locationData));
    } catch (e) {
      emit(LocationError('Error getting location: $e'));
    }
  }
}
