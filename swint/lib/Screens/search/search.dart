import 'dart:ui';

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static String routeName = "/search";
  @override
  _SearchScreen createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Find Friends",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 21,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black),
          toolbarHeight: 30,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        height: 55,
                        width: 55,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff651CE5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You may Know",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 21,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: size.height * 0.25,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(4, (i) {
                        return card();
                      })
                    ],
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      "Most Followed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 40,
                    itemBuilder: (ctx, i) => Card(
                          margin: EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/px1.jpg",
                                fit: BoxFit.cover,
                                width: 200,
                              ),
                              ClipPath(
                                clipper: MyClipath(),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.2)),
                                  ),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  right: 10,
                                  child: Chip(
                                    backgroundColor: Color(0xff651CE5),
                                    label: Text(
                                      "128k",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              Positioned(
                                  bottom: 0,
                                  left: 10,
                                  child: Chip(
                                    backgroundColor: Colors.white,
                                    label: Text(
                                      "@ash_uy",
                                    ),
                                  )),
                            ],
                          ),
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card card() {
    return Card(
      elevation: 50,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Image.asset("assets/images/px2.jpg",
            width: 120, fit: BoxFit.contain, height: 110),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "@Sammy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)),
          onPressed: () {},
          child: Text(
            "Follow",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MyClipath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(size.width - 10, size.height - 30, 0, size.height);
    // path.lineTo(size.width, 0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
