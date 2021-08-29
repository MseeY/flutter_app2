
import 'package:flutter/material.dart';
import 'package:flutter_app2/core/utils/location_utils.dart';

import '../../injector.dart';

class LocationProvider extends ChangeNotifier{

//* ----------------------------
  //* This is side for property data
  //* ----------------------------

  //* Location Address
  String? _address;
  String? get address => _address;

  //* Location Coordinate
  double? _latitude;
  double? get latitude => _latitude;
  double? _longitude;
  double? get longitude => _longitude;

  //* Dependency Injection
  LocationUtils locationUtils = locator<LocationUtils>();

  //* ----------------------------
  //* Function field
  //* ----------------------------

  /// Function to load location from GPS and address
  void loadLocation() async {
    locationUtils.getLocation();

    _address = await locationUtils.getAddress();
    print("_address==="+_address.toString());
    print("locationUtils.latitude=="+locationUtils.latitude.toString());
    print("locationUtils.longitude=="+locationUtils.longitude.toString());
    _latitude = locationUtils.latitude;
    _longitude = locationUtils.longitude;
    notifyListeners();
  }

}