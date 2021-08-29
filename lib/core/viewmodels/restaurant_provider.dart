
import 'package:flutter/material.dart';
import 'package:flutter_app2/core/models/restaurant_model.dart';
import 'package:flutter_app2/core/services/restaurant/restaurant_services.dart';
import 'package:flutter_app2/core/viewmodels/location_provider.dart';
import 'package:flutter_app2/ui/router/router_generator.dart';
import 'package:provider/provider.dart';
import '../../injector.dart';

class RestaurantProvider extends ChangeNotifier {


  //* Restaurant list variable
  List<RestaurantModel>? _restaurantList;
  List<RestaurantModel>? get restaurantList => _restaurantList;

  //* Restaurant list by specific keyword
  late List<RestaurantModel>? _restaurantByKeywordList;
  List<RestaurantModel>? get restaurantByKeywordList => _restaurantByKeywordList;

  //* Restaurant list by specific collection
  late List<RestaurantModel>? _restaurantByCollectionList;
  List<RestaurantModel>? get restaurantByCollectionList => _restaurantByCollectionList;

  //* To handle event search
  bool _onSearch = false;

  //* Dependency Injection
  RestaurantServices restaurantServices = locator<RestaurantServices>();

  /// Function to get all restaurant by coordinate
  void getAll(BuildContext context) async {
    final locationProv = Provider.of<LocationProvider>(context, listen: false);
    _restaurantList = await restaurantServices.getAll(
        locationProv.latitude.toString(), locationProv.longitude.toString(),
        context);
    notifyListeners();
  }

  /// Function to search location
  void getAllByKeyword(String keyword, BuildContext context) async {

    //* Set search state to active
    setOnSearch(true);

    //* Clear previous history
    clearResturantSearch();

    //* Then fetch new keyword
    final locationProv = Provider.of<LocationProvider>(context, listen: false);
    print("l=="+locationProv.latitude.toString());
    print("long=="+locationProv.latitude.toString());
    _restaurantByKeywordList = await restaurantServices.getAllByKeyword(
        keyword, locationProv.longitude.toString(),
        locationProv.longitude.toString(), context);

    //* Set search state to deactive
    setOnSearch(false);
    notifyListeners();
  }


  /// Function to get restaurant by collection
  void getAllByCollection(String collectionID, BuildContext context) async {
    _restaurantByCollectionList = await restaurantServices.getAllByCollection(
        collectionID, context);
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

  /// Function to clear restaurant list by collection
  void clearRestaurantByCollection() {
    _restaurantByCollectionList = null;
    notifyListeners();
  }

  /// Function to navigate to search restaurant
  void goToSearchRestaurant(BuildContext context) async {
    clearResturantSearch();
    Navigator.pushNamed(context, RouterGenerator.routeRestaurantSearch);
  }

}