import 'package:location/location.dart';

class LocationDevice{
  final location = Location();
  Future initLocationService() async {

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    var loc = await location.getLocation();
  }

  Future<String> getLocationString() async{
    final loc = await location.getLocation();
    return "${loc.latitude} ${loc.longitude}";
  }
}