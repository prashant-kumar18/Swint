// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Home/home_card.dart';
import 'package:swint/Screens/Home/openstory.dart';
import 'package:swint/Screens/profile/profile_screen.dart';
import 'package:swint/Screens/search/search.dart';
import 'package:swint/components/custom_navbar.dart';
import 'package:swint/components/data.dart';
import 'package:swint/components/enums.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  int current = 0;
  AnimationController? animateController;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return SafeArea(
      child: Scaffold(
        appBar: current == 0
            ? AppBar(
                toolbarHeight: 30,
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0,
                title: Image.asset(
                  "assets/images/swintb.png",
                  scale: 5,
                ),
              )
            : null,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              if (current == 0)
                FadeIn(key: ValueKey("homescreen"), child: HomeMain()),
              if (current == 1)
                FadeIn(key: ValueKey("discover"), child: Discover()),
              if (current == 2)
                FadeIn(key: ValueKey("searchscreen"), child: SearchScreen()),
              if (current == 3)
                FadeIn(key: ValueKey("profilescreen"), child: ProfileScreen()),
              Positioned(
                bottom: 0,
                child: CustomNavBar(selectedMenu: (v) {
                  setState(() {
                    current = v;
                  });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeMain extends StatelessWidget {
  const HomeMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (ctx, i) => Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, OpenStory.routeName);
                                },
                                child: Stack(
                                  children: [
                                    const Center(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black54,
                                        radius: 27,
                                        child: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                            "assets/images/px1.jpg",
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (i == 0)
                                      Container(
                                        alignment: Alignment.bottomRight,
                                        width: 50,
                                        height: 70,
                                        child: Container(
                                          padding: EdgeInsets.all(1),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: const FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: Colors.pinkAccent,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 150,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.black.withOpacity(0.05),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.white,
                                        ),
                                        height: 45,
                                        width: 45,
                                        child: Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/avtar.jpg'),
                                            radius: 25,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      child: Text(
                                        "Alina",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: SvgPicture.asset(
                                        "assets/icons/tick.svg",
                                        height: 21,
                                        color: Color(0xff00d289),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...List.generate(
              posts.length,
              (index) {
                Map post = posts[index];
                return HomeCard(
                  dp: post["dp"],
                  name: post['name'],
                  img: "assets/images/dm$index.jpg",
                  des: post['des'],
                  hash: post['hash'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
