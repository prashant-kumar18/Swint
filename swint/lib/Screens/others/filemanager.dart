import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';
import 'package:swint/main.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swint/provider/provider.dart';

class FileManagerUi extends StatefulWidget {
  static String routeName = "/filemanager";
  FileManagerUi({Key? key}) : super(key: key);

  @override
  _FileManagerUi createState() => _FileManagerUi();
}

class _FileManagerUi extends State<FileManagerUi> {
  late CameraController controller;

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.takePicture();
          },
          child: Icon(
            Icons.camera,
            size: 40,
          ),
        ),
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
                return Consumer<DataProvider>(builder: (ctx, dataprovider, _) {
                  var files = dataprovider.files;
                  return FutureBuilder<List<String>>(
                      future: dataprovider.getphotospaths(),
                      builder: (context, snapshot) {
                        // Image.asset("assets/images/load.gif")
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? CircularProgressIndicator()
                            : GridView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                //if file/folder list is grabbed, then show here
                                itemCount: files.length,
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
                      });
                });
              }),
        ));
  }
}
