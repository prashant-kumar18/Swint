import 'package:flutter/material.dart';
import 'package:swint/Screens/Home/home_screen.dart';
import 'package:swint/Screens/auth/login.dart';
import 'package:swint/Screens/auth/register.dart';
import 'package:swint/swipper.dart';
import 'navi_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor colorCustom = MaterialColor(0xff651CE5, mycolor);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: const ScrollBehavior(),
      title: 'Swint',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        fontFamily: "Sans serif",
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: Swipper.routeName,
      routes: routes,
      initialRoute: Login.routeName,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Map<int, Color> mycolor = {
  50: Color.fromRGBO(102, 28, 229, .1),
  100: Color.fromRGBO(102, 28, 229, .2),
  200: Color.fromRGBO(102, 28, 229, .3),
  300: Color.fromRGBO(102, 28, 229, .4),
  400: Color.fromRGBO(102, 28, 229, .5),
  500: Color.fromRGBO(102, 28, 229, .6),
  600: Color.fromRGBO(102, 28, 229, .7),
  700: Color.fromRGBO(102, 28, 229, .8),
  800: Color.fromRGBO(102, 28, 229, .9),
  900: Color.fromRGBO(102, 28, 229, 1),
};
