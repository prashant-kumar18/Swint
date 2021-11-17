import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class OpenStory extends StatefulWidget {
  static String routeName = "/openstory";
  OpenStory({
    Key? key,
  }) : super(key: key);

  @override
  _OpenStory createState() => _OpenStory();
}

class _OpenStory extends State<OpenStory> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => controller.play());
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height,
                child: VideoPlayer(controller),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  height: size.height,
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/px1.jpg"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Chip(
                            label: Text("@Ash_Malhothra"),
                            backgroundColor: Colors.white,
                          ),
                        ]),
                        Chip(
                          backgroundColor: Colors.purple,
                          label: Text(
                            "This it the title of the video",
                            style: TextStyle(
                                fontSize: 21,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ])),
              Positioned(
                bottom: 10,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.newspaper,
                                  color: Colors.white,
                                ),
                                Text("  128K")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.redAccent,
                                ),
                                Text("  128K")
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            label: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.comment,
                                  color: Colors.blueAccent,
                                ),
                                Text("  12K")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Chip(
                        backgroundColor: Colors.white,
                        label: Text(
                          "This it the Description of the video...",
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Listener(
                onPointerMove: (v) {
                  if (v.delta.dy > 10) Navigator.pop(context);
                },
                child: Container(
                    alignment: Alignment.center,
                    height: size.height / 1.5,
                    child: VideoPlayer(controller)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
