import 'package:geolocator/geolocator.dart';

class GeoloctorService {
  Future<Position> getCurrentlocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
