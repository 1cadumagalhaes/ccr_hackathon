import 'package:caminhoes_app/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:scoped_model/scoped_model.dart';

class LocationModel extends Model {
 
  GeolocationStatus _geoStatus;
  PermissionStatus _permissionStatus;
  Position position;
  Map<String, dynamic> address;
  
  UserModel user;
  LocationModel(this.user) {
    if (user.isLoggedIn()) _checkPermission();
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    if (_geoStatus == GeolocationStatus.granted ||
        _permissionStatus == PermissionStatus.granted)
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        print(position);
        this.position = position;
        notifyListeners();
        _getAddresFromPosition(position);
      }).catchError((e) {
        print(e);
      });
  }

  _getPermission() {
    LocationPermissions().requestPermissions().then((value) {
      this._permissionStatus = value;
      print(value);
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  _checkPermission() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.checkGeolocationPermissionStatus().then((value) {
      print(value);
      this._geoStatus = value;
      notifyListeners();
      if (value == GeolocationStatus.unknown) _getPermission();
      if (value == GeolocationStatus.granted) {
        _getCurrentLocation();
        _listenPosition();
      }
    }).catchError((e) {
      print(e);
    });
  }

  _listenPosition() {
    if (_geoStatus == GeolocationStatus.granted) {
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
      var locationOptions =
          LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

      geolocator.getPositionStream(locationOptions).listen((Position position) {
        this.position = position;
        notifyListeners();
        _getAddresFromPosition(position);
        print(position == null
            ? 'Unknown'
            : position.latitude.toString() +
                ', ' +
                position.longitude.toString());
      });
    }
  }

  _getAddresFromPosition(position) {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.placemarkFromCoordinates(position.latitude, position.longitude, localeIdentifier: 'pt_BR').then((value){
      this.address= value[0].toJson();
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }


}
