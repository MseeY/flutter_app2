
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/core/viewmodels/restaurant_provider.dart';
import 'package:flutter_app2/ui/screens/wighets/search_item.dart';
import 'package:provider/provider.dart';

class RestaurantSearchScreen extends StatefulWidget {

  @override
  _RestaurantSearchScreenState createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {

  var searchController = TextEditingController();

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
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back,color: Colors.black54)
        ),
        title: _appBar(),
      ),
    );

  }

//  Widget _appBar(){
//    return Provider<RestaurantProvider>(
//      create: (context)=> RestaurantProvider(),
//      builder: (context,_){
//        return SearchItem(
//                controller: searchController,
//                autoFocus: true,
//                onSubmit: (value) => RestaurantProvider().getAllByKeyword(value, context),
//              );;
//      },
//    );
//  }

  Widget _appBar() {
    return Builder(
      builder: (context) {
        return Consumer<RestaurantProvider>(
          builder: (context, restaurantProv, _) {

            return SearchItem(
              controller: searchController,
              autoFocus: true,
              onSubmit: (value) => restaurantProv.getAllByKeyword(value, context),
            );
          },
        );
      },
    );

  }

//  Widget _appBar() {
//    return Builder(
//        builder: (context) {
//          return Provider<RestaurantProvider>(
//            create: (context) => RestaurantProvider(),
//            builder: (context, _) {
//              return SearchItem(
//                controller: searchController,
//                autoFocus: true,
//                onSubmit: (value) => RestaurantProvider().getAllByKeyword(value, context),
//              );
//            },
//
//          );
//        });
//  }
}
