import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:tflite/tflite.dart';
// ignore: unused_import
import 'package:tflite_flutter/tflite_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:tflite_v2/tflite_v2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  bool _loading = true;
  late File _image;
  late List _output;
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/model_unquant.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 85),
            Text(
              'Sri Lankan Best',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            SizedBox(height: 6),
            Text(
              'Detect Food',
              style: TextStyle(color: Colors.black, fontSize: 35),
            ),
            SizedBox(height: 40),
            Center(
              child: _loading
                  ? Container(
                      width: 250,
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/app.png'),
                          SizedBox(height: 50),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 250,
                            child: Image.file(_image),
                          ),
                          SizedBox(height: 20),
                          // ignore: unnecessary_null_comparison
                          _output != null
                              ? Text(
                                  '${_output[0]}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: <Widget>[
                GestureDetector(
                  onTap: pickImage,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Take a photo',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: pickGalleryImage,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 150,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Camera Roll',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
