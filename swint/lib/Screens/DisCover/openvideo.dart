import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class OpenVideo extends StatefulWidget {
  static String routeName = "/openytvideo";
  OpenVideo({
    Key? key,
  }) : super(key: key);

  @override
  _OpenVideoState createState() => _OpenVideoState();
}

class _OpenVideoState extends State<OpenVideo> {
  @override
  Widget build(BuildContext context) {
    var _controller =
        ModalRoute.of(context)!.settings.arguments as YoutubePlayerController;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: size.height,
                child: Listener(
                  onPointerMove: (v) {
                    print(v.delta.dy);
                    if (v.delta.dy > 10) Navigator.pop(context);
                  },
                  child: YoutubePlayerIFrame(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
