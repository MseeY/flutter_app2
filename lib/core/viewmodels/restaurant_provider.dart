


import 'package:flutter/material.dart';
import 'package:flutter_app2/core/models/restaurant_model.dart';
import 'package:flutter_app2/ui/router/router_generator.dart';

class RestaurantProvider extends ChangeNotifier {

  //* Restaurant list by specific keyword
  late List<RestaurantModel>? _restaurantByKeywordList;
  List<RestaurantModel>? get restaurantByKeywordList => _restaurantByKeywordList;

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