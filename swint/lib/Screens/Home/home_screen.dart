// ignore_for_file: use_key_in_widget_constructors
import 'dart:ui' as ui;
import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:swint/Screens/DisCover/discover_screen.dart';
import 'package:swint/Screens/Home/home_card.dart';
import 'package:swint/Screens/Home/openstory.dart';
import 'package:swint/Screens/profile/profile_screen.dart';
import 'package:swint/Screens/search/search.dart';
import 'package:swint/components/custom_navbar.dart';
import 'package:swint/components/data.dart';
import 'package:animate_do/animate_do.dart';
// import 'package:swint/Screens/others/filemanager.dart';
import 'package:swint/provider/provider.dart';

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

class HomeMain extends StatefulWidget {
  HomeMain({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  bool storyorpost = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(children: [
          Column(
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
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (ctx, i) => Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () async {
                                    if (i == 0) {
                                      // Navigator.pushNamed(
                                      //     context, Temp.routeName);
                                      setState(() {
                                        storyorpost = !storyorpost;
                                      });
                                    } else
                                      Navigator.pushNamed(
                                          context, OpenStory.routeName);
                                  },
                                  onLongPress: () {
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
                      Consumer<DataProvider>(
                        builder: (ctx, dataprovider, _) => DropdownButton(
                            underline: Container(),
                            icon: Container(),
                            hint: Chip(
                              shadowColor: dataprovider.statusccolor(),
                              elevation: 7,
                              backgroundColor: dataprovider.statusccolor(),
                              label: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      " ${dataprovider.statusname()} ",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                        "assets/icons/tick.svg",
                                        fit: BoxFit.fitHeight,
                                        width: 20,
                                      ))
                                ],
                              ),
                            ),
                            alignment: Alignment.center,
                            onChanged: (v) {
                              dataprovider.statusfun(v);
                            },
                            items: [
                              DropdownMenuItem(
                                  value: 0,
                                  child: Text(
                                    " Busy ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.red),
                                  )),
                              DropdownMenuItem(
                                  value: 1,
                                  child: Text(
                                    " Away ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.blue),
                                  )),
                              DropdownMenuItem(
                                  value: 2,
                                  child: Text(
                                    " Online ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.green),
                                  )),
                            ]),
                      )
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
          if (storyorpost)
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 20),
              child: Container(
                height: size.height,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                          onPressed: () async {
                            await openfilemanager(context);
                            setState(() {
                              storyorpost = !storyorpost;
                            });
                          },
                          color: Colors.white,
                          shape: CircleBorder(),
                          child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Text("Story"))),
                      MaterialButton(
                          onPressed: () async {
                            await openfilemanager(context);
                            setState(() {
                              storyorpost = !storyorpost;
                            });
                          },
                          color: Colors.white,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Text("Post"),
                          )),
                    ],
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }
}

openfilemanager(context) async {
  Provider.of<DataProvider>(context, listen: false).opener();
  final List<ImageObject>? objects = await Navigator.of(context)
      .push(PageRouteBuilder(pageBuilder: (context, animation, __) {
    return const ImagePicker(maxCount: 5);
  }));
}
