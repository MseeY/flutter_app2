
import 'package:flutter/material.dart';
import 'package:flutter_app2/core/models/restaurant_model.dart';
import 'package:flutter_app2/core/services/restaurant/restaurant_services.dart';
import 'package:flutter_app2/core/viewmodels/location_provider.dart';
import 'package:flutter_app2/ui/router/router_generator.dart';
import 'package:provider/provider.dart';
import '../../injector.dart';

class RestaurantProvider extends ChangeNotifier {

  //* Restaurant list by specific keyword
  late List<RestaurantModel>? _restaurantByKeywordList;
  List<RestaurantModel>? get restaurantByKeywordList => _restaurantByKeywordList;

  //* To handle event search
  bool _onSearch = false;

  //* Dependency Injection
  RestaurantServices restaurantServices = locator<RestaurantServices>();

  /// Function to search location
  void getAllByKeyword(String keyword, BuildContext context) async {

    //* Set search state to active
    setOnSearch(true);

    //* Clear previous history
    clearResturantSearch();

    //* Then fetch new keyword
    final locationProv = Provider.of<LocationProvider>(context, listen: false);
    _restaurantByKeywordList = await restaurantServices.getAllByKeyword(
        keyword, locationProv.latitude.toString(),
        locationProv.longitude.toString(), context);

    //* Set search state to deactive
    setOnSearch(false);
    notifyListeners();
  }

  /// Function to handle onsearch state
  void setOnSearch(bool status) {
    _onSearch = status;
    notifyListeners();
  }

  /// Function to clear restaurant list by collection
  void clearResturantSearch() {
    _restaurantByKeywordList = null;
    notifyListeners();
  }

  /// Function to navigate to search restaurant
  void goToSearchRestaurant(BuildContext context) async {
    clearResturantSearch();
    Navigator.pushNamed(context, RouterGenerator.routeRestaurantSearch);
  }

}