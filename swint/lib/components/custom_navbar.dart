// ignore_for_file:  file_names

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Home/home_screen.dart';
import 'package:swint/Screens/profile/profile_screen.dart';
import 'package:swint/Screens/search/search.dart';
import 'package:swint/components/enums.dart';

class CustomNavBar extends StatefulWidget {
  Function(int) selectedMenu;

  CustomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  var current = 0;

  @override
  Widget build(BuildContext context) {
    Route? route = ModalRoute.of(context);
    return Container(
      color: Colors.transparent,
      height: 140,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 8,
                  offset: const Offset(0, 10), // changes position of shadow
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: current == 0
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          widget.selectedMenu(0);
                          setState(() {
                            current = 0;
                          });
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 60,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 18, 18, 0),
                                child: current == 0
                                    ? SvgPicture.asset(
                                        "assets/icons/home.svg",
                                        color: const Color(0xff651CE5),
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/home-outline.svg",
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Home",
                                style: TextStyle(
                                    color: current == 0
                                        ? const Color(0xff651CE5)
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.selectedMenu(1);
                        setState(() {
                          current = 1;
                        });
                      },
                      child: Container(
                        decoration: current == 1
                            ? BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 8,
                                      offset: const Offset(
                                          0, 5), // changes position of shadow
                                    ),
                                  ])
                            : null,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                              width: 60,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 18, 18, 0),
                                child: current == 1
                                    ? SvgPicture.asset(
                                        "assets/icons/discover.svg",
                                        color: const Color(0xff651CE5),
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/discover-outline.svg",
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                "Discover",
                                style: TextStyle(
                                    color: current == 1
                                        ? const Color(0xff651CE5)
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: current == 2
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: const Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          widget.selectedMenu(2);
                          setState(() {
                            current = 2;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 45,
                                width: 60,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: current == 2
                                      ? Icon(
                                          Icons.search_outlined,
                                          size: 25,
                                          color: Color(0xff651CE5),
                                        )
                                      : Icon(
                                          Icons.search,
                                          size: 30,
                                        ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: FittedBox(
                                child: Text("Search",
                                    style: TextStyle(
                                        color: current == 2
                                            ? Color(0xff651CE5)
                                            : Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: current == 3
                          ? BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 8,
                                    offset: Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ])
                          : null,
                      child: GestureDetector(
                        onTap: () {
                          widget.selectedMenu(3);
                          setState(() {
                            current = 3;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 45,
                              width: 60,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
                                child: current == 3
                                    ? SvgPicture.asset(
                                        "assets/icons/profile.svg",
                                        color: Color(0xff651CE5),
                                      )
                                    : SvgPicture.asset(
                                        "assets/icons/profile-outline.svg",
                                      ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: current == 3
                                          ? Color(0xff651CE5)
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
