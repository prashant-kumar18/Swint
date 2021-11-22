import 'dart:io';

import 'package:advance_image_picker/advance_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:swint/components/enums.dart';

// import 'package:provider/provider.dart';

class DataProvider extends ChangeNotifier {
  List<String> visited = [];
  List<String> files = [];
  int status = 0;
  final configs = ImagePickerConfigs();

  opener() {
    List<ImageObject> _imgObjs = [];
    configs.appBarTextColor = Colors.black;
    configs.appBarBackgroundColor = Colors.white;
    configs.translateFunc = (name, value) => Intl.message(value, name: name);

    // Disable edit function, then add other edit control instead
    configs.adjustFeatureEnabled = false;
    configs.cropFeatureEnabled = false;

    configs.externalImageEditors['external_image_editor_1'] = EditorParams(
        title: 'external_image_editor_1',
        icon: Icons.edit_rounded,
        onEditorEvent: (
                {required BuildContext context,
                required File file,
                required String title,
                int maxWidth = 1080,
                int maxHeight = 1920,
                int compressQuality = 90,
                ImagePickerConfigs? configs}) async =>
            Navigator.of(context).push(MaterialPageRoute<File>(
                fullscreenDialog: true,
                builder: (context) => ImageEdit(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));
    configs.externalImageEditors['external_image_editor_2'] = EditorParams(
        title: 'external_image_editor_2',
        icon: Icons.edit_attributes,
        onEditorEvent: (
                {required BuildContext context,
                required File file,
                required String title,
                int maxWidth = 1080,
                int maxHeight = 1920,
                int compressQuality = 90,
                ImagePickerConfigs? configs}) async =>
            Navigator.of(context).push(MaterialPageRoute<File>(
                fullscreenDialog: true,
                builder: (context) => ImageSticker(
                    file: file,
                    title: title,
                    maxWidth: maxWidth,
                    maxHeight: maxHeight,
                    configs: configs))));
  }

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
