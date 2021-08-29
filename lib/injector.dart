import 'package:get_it/get_it.dart';

import 'core/services/collection/collection_services.dart';
import 'core/services/restaurant/restaurant_services.dart';
import 'core/utils/location_utils.dart';

GetIt locator = GetIt.instance;
void setupLocator() async {

  //* Register as singleton
//  await locator.registerSingleton(CollectionServices());
  locator.registerSingleton<CollectionServices>(CollectionServices());
  locator.registerSingleton<RestaurantServices>(RestaurantServices());
  locator.registerSingleton<LocationUtils>(LocationUtils());
//  locator.registerLazySingleton<RestaurantServices>(
//        () => RestaurantServices(),
//  );
//  await locator.registerSingleton(ReviewServices());

}
