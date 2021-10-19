import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hitch_hike/screens/map/geolocator_services.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLoctorService = GeoloctorService();

  //varibles
  Position currentLocation;
  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLoctorService.getCurrentlocation();
    notifyListeners();
  }
}
