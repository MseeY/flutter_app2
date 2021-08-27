
import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/screens/home/home_screen.dart';
import 'package:flutter_app2/ui/screens/restaurant/restaurant_search_screen.dart';

class RouterGenerator{

  static const routeHome = "/home";
  static const routeRestaurantSearch = "/restaurant/search";

  static Route<dynamic>? generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case routeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case routeRestaurantSearch:
        return MaterialPageRoute(builder: (_) => RestaurantSearchScreen());
    }
  }
}
