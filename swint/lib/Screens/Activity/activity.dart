import 'package:flutter/material.dart';
import 'package:swint/components/data.dart';

class Activity extends StatefulWidget {
  static String routeName = "/discover";
  @override
  _Activity createState() => _Activity();
}

class _Activity extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Activity",
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 20,
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            itemCount: friends.length,
            itemBuilder: (BuildContext context, int index) {
              Map friend = friends[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    height: 55,
                    width: 55,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          friend["dp"],
                        ),
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Text(friend['name']),
                  subtitle: Text(friend['status']),
                  trailing: friend['isAccept']
                      ? Container(
                          width: 100.0,
                          height: 38.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff651CE5).withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.1, 0.9],
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.

                                Colors.black.withOpacity(0.5),
                                Colors.grey,
                              ],
                            ),
                          ),
                          child: FlatButton(
                            child: Text(
                              'Posted New Pic',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {},
                          ),
                        )
                      : Container(
                          width: 100.0,
                          height: 38.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff651CE5).withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 8,
                                offset:
                                    Offset(0, 5), // changes position of shadow
                              ),
                            ],
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: [0.1, 0.9],
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Color(0xff651CE5),
                                Color(0xff811ce5),
                              ],
                            ),
                          ),
                          child: FlatButton(
                            child: Text(
                              'Followed You',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            onPressed: () {},
                          ),
                        ),
                  onTap: () {},
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
