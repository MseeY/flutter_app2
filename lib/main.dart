import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/constant/constant.dart';
import 'package:flutter_app2/ui/router/router_generator.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/location_provider.dart';
import 'core/viewmodels/restaurant_provider.dart';
import 'injector.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Resto',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: primaryColor,
          primaryColor: primaryColor,
          cursorColor: primaryColor,
          fontFamily: 'NunitoSans',
          scaffoldBackgroundColor: Colors.white,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
              TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                transitionType: SharedAxisTransitionType.horizontal,
              ),
            },
          ),
        ),
        initialRoute: RouterGenerator.routeHome,
        onGenerateRoute: RouterGenerator.generateRoute,
      ),
    );
  }
}
