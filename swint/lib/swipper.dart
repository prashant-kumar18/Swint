import 'package:flutter/material.dart';
import 'package:swint/Screens/Activity/activity.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Inbox/chat_screen.dart';

import 'Screens/Home/home_screen.dart';

class Swipper extends StatefulWidget {
  static String routeName = "/swipper";
  Swipper({Key? key}) : super(key: key);

  @override
  _SwipperState createState() => _SwipperState();
}

class _SwipperState extends State<Swipper> {
  PageController pc = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [Activity(), HomeScreen(), InboxScreen()],
      ),
    );
  }
}
