import 'package:geolocator/geolocator.dart';

class Myloction {
  var latitude;
   var longitude;
  Future <void> getloction ()async{
    try {

      LocationPermission permission = await Geolocator.requestPermission();

      permission = await Geolocator.checkPermission();
      // await Geolocator.openAppSettings();
      // await Geolocator.openLocationSettings();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {

          return Future.error('Location permissions are denied');
        }
      }
      latitude=position.latitude;
      longitude= position.longitude;
      print(longitude);
    }
    catch(e){
      print(e);
    }
  }

}