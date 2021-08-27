import 'package:flutter/material.dart';
import 'package:flutter_app2/ui/router/router_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YmxDemo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: RouterGenerator.routeHome,
      onGenerateRoute: RouterGenerator.generateRoute,

    );
  }
}
