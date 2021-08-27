import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/core/viewmodels/restaurant_provider.dart';
import 'package:flutter_app2/ui/screens/wighets/search_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{


  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        title: _appBar(),

      ),
    );
  }

  Widget _appBar(){
    return Builder(
        builder: (context){
          return Provider<RestaurantProvider>(
            create: (context)=> RestaurantProvider(),
            builder: (context,_){
              return SearchItem(
                controller: searchController,
                onClick: () => RestaurantProvider().goToSearchRestaurant(context),
                readOnly: true,
              );
            },

          );
        });

//      Builder(
//      builder: (context){
//        return Consumer<RestaurantProvider>(
//          builder: (context,restaurantProv,_){
//            return SearchItem(
//              controller: searchController,
//              onClick: (){
//                restaurantProv.goToSearchRestaurant(context);
//              },
//              readOnly: true,
//            );
//          }
//
//        );
//      }
//    );
  }
}
