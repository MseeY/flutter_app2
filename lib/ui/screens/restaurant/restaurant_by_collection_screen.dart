
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app2/core/models/collection_model.dart';
import 'package:flutter_app2/core/viewmodels/restaurant_provider.dart';
import 'package:flutter_app2/ui/screens/wighets/restaurant_item.dart';
import 'package:provider/provider.dart';

class RestaurantByCollectionScreen extends StatelessWidget {

  final CollectionModel collection;
  RestaurantByCollectionScreen({
    required this.collection
  });

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
        title: Text(
          collection.title.toString(),
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: RestaurantByCollectionBody(
        collection: collection,
      ),
    );
  }
}

class RestaurantByCollectionBody extends StatelessWidget {
  final CollectionModel collection;
  RestaurantByCollectionBody({
    required this.collection
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            _restoranList(),
          ],
        ),
      ),
    );
  }

  Widget _restoranList() {
    return Builder(
      builder: (context) {
        return Consumer<RestaurantProvider>(
          builder: (context, restaurantProv, _) {

            //* If collection data null then fetch
            if (restaurantProv.restaurantByCollectionList == null) {
              restaurantProv.getAllByCollection(collection.id.toString(), context);
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            //* If collection is not found
            if (restaurantProv.restaurantList!.length == 0) {
              return Center(
                child: Text(
                  "Restoran tidak ditemukan"
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: restaurantProv.restaurantByCollectionList!.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {

                var restaurant = restaurantProv.restaurantByCollectionList![index];
                return RestaurantItem(
                  restaurant: restaurant
                );
              },
            );
          },
        );
      },
    );
  }
}