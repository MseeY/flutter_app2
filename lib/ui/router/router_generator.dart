
import 'package:flutter/material.dart';
import 'package:flutter_app2/core/models/collection_model.dart';
import 'package:flutter_app2/ui/screens/home/home_screen.dart';
import 'package:flutter_app2/ui/screens/restaurant/restaurant_by_collection_screen.dart';
import 'package:flutter_app2/ui/screens/restaurant/restaurant_search_screen.dart';

class RouterGenerator{

  static const routeHome = "/home";
  static const routeRestaurantSearch = "/restaurant/search";
  static const routeRestaurantByCollection = "/restaurant/collection";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch(settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case routeRestaurantSearch:
        return MaterialPageRoute(builder: (_) => RestaurantSearchScreen());
      case routeRestaurantByCollection:
        if (args is CollectionModel) {
          return MaterialPageRoute(builder: (_) => RestaurantByCollectionScreen(
            collection: args,
          ));
        }
        break;
    }
  }
}
