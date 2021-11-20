import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swint/components/enums.dart';

// import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  List<String> visited = [];
  List<String> files = [];
  int status = 0;

  Future<List<String>> getphotospaths() async {
    Directory dir = Directory("/storage/emulated/0/DCIM/Camera");
    try {
      files = dir
          .listSync(followLinks: false, recursive: true)
          .map((e) => e.path)
          .where((i) {
        return i.endsWith(".jpg");
      }).toList();
    } catch (e) {
      print("error===" + e.toString());
    }

    return files;
  }

  statusfun(v) {
    status = v;
    notifyListeners();
  }

  statusccolor() {
    if (status == 0)
      return Colors.red[400];
    else if (status == 1)
      return Colors.blue[400];
    else
      return Colors.green[400];
  }

  statusname() {
    if (status == 0)
      return "Busy";
    else if (status == 1)
      return "Away";
    else
      return "Online";
  }
}
