import 'package:flutter/material.dart';

class SelectInt extends StatefulWidget {
  static String routeName = "/selectint";
  SelectInt({Key? key}) : super(key: key);

  @override
  _SelectIntState createState() => _SelectIntState();
}

class _SelectIntState extends State<SelectInt> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) => SafeArea(
          child: Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/category.gif",
                  height: constraints.maxHeight * 0.25,
                ),
                Container(
                  width: size.width * 0.7,
                  child: Text(
                    "Choose Categories that may Interests you",
                    style: TextStyle(color: Colors.black, fontSize: 21),
                  ),
                ),
                Wrap(
                  children: [
                    interests("Interest 1", false),
                    interests("Interest 1", false),
                    interests("Interest 1", true),
                    interests("Interest 1", true),
                    interests("Interest 1", true),
                    interests("Interest 1", true),
                    interests("Interest 1", true),
                    interests("Interest 1", false),
                    interests("Interest 1", false),
                    interests("Interest 1", false),
                    interests("Interest 1", false),
                    interests("Interest 1", false),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: MediaQuery.of(context).size.width * 0.3,
                  color: Colors.pinkAccent,
                  child: const Text(
                    "Customize",
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(40)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Padding interests(text, t) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Chip(
        backgroundColor:
            t ? Colors.purpleAccent[700]!.withOpacity(0.7) : Colors.grey[200],
        label: Text(text)),
  );
}
