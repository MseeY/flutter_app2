import 'package:flutter/material.dart';
import 'package:flutter_app2/core/config/api.dart';
import 'package:flutter_app2/core/models/restaurant_model.dart';
import 'package:flutter_app2/core/services/base/base_services.dart';

class RestaurantServices extends BaseServices{


  Future<List<RestaurantModel>> getAllByKeyword(String keyword, String latitude, String longitude, BuildContext context) async {
    var resp = await request(Api.instance.searchRestaurantByKeyword
        .replaceAll("%latitude%", latitude)
        .replaceAll("%longitude%", longitude)
        .replaceAll("%keyword%", keyword),
        RequestType.GET, context,
        useToken: true);

    var restaurantList = <RestaurantModel>[];
    //* Check if response contains restaurant list
    if (resp.containsKey("restaurants")) {
      resp["restaurants"].forEach((val) {
        restaurantList.add(RestaurantModel.fromJson(val["restaurant"]));
      });
    }

    return restaurantList;
  }

}