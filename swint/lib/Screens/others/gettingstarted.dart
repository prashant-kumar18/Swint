import 'package:flutter/material.dart';
import 'package:swint/Screens/Home/home_screen.dart';
import 'package:swint/Screens/auth/selectint.dart';

class GettingStarted extends StatefulWidget {
  static String routeName = "/gettingstarted";
  const GettingStarted({Key? key}) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
  PageController pc = PageController();
  var currentindex = 0;
  @override
  void initState() {
    pc = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        onPressed: () {
          currentindex += 1;
          if (currentindex < 3) {
            setState(() {
              pc.animateToPage(currentindex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            });
          } else {
            Navigator.of(context).popAndPushNamed(SelectInt.routeName);
          }
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).popAndPushNamed(SelectInt.routeName);
              },
              child: const Text(
                "SKIP",
                style: TextStyle(color: Colors.black54),
              ))
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentindex = page;
              });
            },
            controller: pc,
            children: [
              makepage(
                  image: "assets/images/ph.gif",
                  title: "Title 1",
                  description: "Description....."),
              makepage(
                  image: "assets/images/ph.gif",
                  title: "Title 2",
                  description: "Description....."),
              makepage(
                  image: "assets/images/ph.gif",
                  title: "Title 3",
                  description: "Description....."),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeindicator(currentindex),
            ),
          )
        ],
      ),
    );
  }
}

Widget makeindicatorlines(iscurrent) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: AnimatedContainer(
      width: iscurrent ? 30 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.orange,
      ),
      duration: const Duration(milliseconds: 300),
    ),
  );
}

List<Widget> makeindicator(currentindex) {
  List<Widget> l = [];
  for (var i = 0; i < 3; i++) {
    if (currentindex == i) {
      l.add(makeindicatorlines(true));
    } else {
      l.add(makeindicatorlines(false));
    }
  }
  return l;
}

Widget makepage({image, title, description}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        image,
        fit: BoxFit.cover,
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      )
    ],
  );
}
