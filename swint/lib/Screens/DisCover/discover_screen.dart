import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:swint/Screens/DisCover/openvideo.dart';
import 'package:swint/main.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Discover extends StatefulWidget {
  static String routeName = "/discover";
  @override
  _Discover createState() => _Discover();
}

class _Discover extends State<Discover>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'K18cpp_-gP8',
      params: const YoutubePlayerParams(
        playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
        startAt: Duration(seconds: 30),
        showControls: true,
        showFullscreenButton: true,
        autoPlay: true,
      ),
    );
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Discover",
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.bookmarks_outlined),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Chip(
                      backgroundColor: mycolor[500],
                      label: Text(
                        "India",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Chip(
                      label: Text(
                        "Global",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (ctx, i) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, OpenVideo.routeName,
                                      arguments: _controller);
                                },
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child:
                                              YoutubePlayerControllerProvider(
                                            // Provides controller to all the widget below it.
                                            controller: _controller,
                                            child: YoutubePlayerIFrame(
                                              aspectRatio: 1,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.topCenter,
                                            child: Column(children: [
                                              Text(
                                                "Video Title ",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                " Video Description",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                    ClipPath(
                                      clipper: MyClipath(),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.center,
                                              colors: [
                                                Colors.black87,
                                                Colors.black.withOpacity(0)
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 10,
                                        child: Chip(
                                          backgroundColor: Colors.white,
                                          label: Text(
                                            "@ash ",
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
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
      elevation: 5,
      child: Column(children: [
        Image.asset(
          "assets/images/px1.jpg",
          scale: 7,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Sammy",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 15,
            ),
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
    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
