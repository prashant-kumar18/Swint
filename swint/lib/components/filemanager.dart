import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:swint/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FileManagerUi extends StatefulWidget {
  static String routeName = "/filemanager";
  FileManagerUi({Key? key}) : super(key: key);

  @override
  _FileManagerUi createState() => _FileManagerUi();
}

class _FileManagerUi extends State<FileManagerUi> {
  Directory dir = Directory("/storage/emulated/0");
  late CameraController controller;
  List<String> visited = [];
  List<String> files = [];
  getFiles() async {
    print("object");
    var status = await Permission.storage.request();
    if (status.isGranted)
      print("granted");
    else
      print("not granted");
    await getphotos(dir);
  }

  getphotos(olddir) {
    Directory newdir = olddir;
    for (var item in newdir.listSync()) {
      if (item.runtimeType.toString() == "_Directory" &&
          !visited.contains(item.toString()) &&
          !item.path.contains(".thumbnail")) {
        visited.add(item.toString());
        getphotos(item);
      } else {
        if (item.path.endsWith(".jpg")) {
          files.add(item.path);
        }
      }
    }
    return;
  }

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    getFiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => SlidingUpPanel(
          body: CameraPreview(controller),
          color: Colors.white38,
          maxHeight: constraints.maxHeight,
          minHeight: constraints.maxHeight / 4.5,
          padding: EdgeInsets.all(8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          panelBuilder: (controller) {
            return files.isEmpty
                ? Image.asset("assets/images/load.gif")
                : GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                    //if file/folder list is grabbed, then show here
                    itemCount: files.length == 0 ? 0 : files.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image.file(
                          File(files[index]),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.low,
                          width: 200,
                          height: 200,
                        ),
                      );
                    });
          }),
    ));
  }
}
