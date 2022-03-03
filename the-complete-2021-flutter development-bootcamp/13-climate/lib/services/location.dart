import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
    } on Exception catch (_) {
      latitude = 0.0;
      longitude = 0.0;
    }
  }

  @override
  String toString() {
    return "Latitude:$latitude - Longitude:$longitude";
  }
}
