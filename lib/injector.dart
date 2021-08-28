import 'package:get_it/get_it.dart';

import 'core/services/restaurant/restaurant_services.dart';

GetIt locator = GetIt.instance;
void setupLocator() async {

  //* Register as singleton
//  await locator.registerSingleton(CollectionServices());
  locator.registerSingleton<RestaurantServices>(RestaurantServices());
//  locator.registerLazySingleton<RestaurantServices>(
//        () => RestaurantServices(),
//  );
//  await locator.registerSingleton(ReviewServices());

}
