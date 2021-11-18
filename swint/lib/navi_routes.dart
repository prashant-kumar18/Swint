import 'package:flutter/material.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/DisCover/openvideo.dart';
import 'package:swint/Screens/Home/home_screen.dart';
import 'package:swint/Screens/Home/openstory.dart';
import 'package:swint/Screens/Inbox/chat_screen.dart';
import 'package:swint/Screens/auth/login.dart';
import 'package:swint/Screens/auth/register.dart';
import 'package:swint/Screens/profile/profile_screen.dart';
import 'package:swint/Screens/search/search.dart';
import 'package:swint/components/filemanager.dart';
import 'package:swint/swipper.dart';

final Map<String, WidgetBuilder> routes = {
  //SplashPage.routeName: (context) => SplashPage(),
  HomeScreen.routeName: (context) => HomeScreen(),
  Swipper.routeName: (context) => Swipper(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  InboxScreen.routeName: (context) => InboxScreen(),
  Discover.routeName: (context) => Discover(),
  SearchScreen.routeName: (context) => SearchScreen(),
  OpenVideo.routeName: (context) => OpenVideo(),
  OpenStory.routeName: (context) => OpenStory(),
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  FileManagerUi.routeName: (context) => FileManagerUi()
};
