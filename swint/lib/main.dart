import 'package:flutter/material.dart';
import 'package:swint/components/filemanager.dart';
import 'Screens/auth/login.dart';
import 'navi_routes.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

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
