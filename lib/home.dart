import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'main.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isWorking = false;
  String result = '';

  late CameraController _cameraController;
  late CameraImage _imageCamera;

  initCamera() {
    
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  
    _cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }

      setState(() {
        _cameraController.startImageStream((imagesFromStream) {
          if (!isWorking) {
            isWorking = true;
            _imageCamera = imagesFromStream;
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.jpeg'),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 330.0,
                      width: 330.0,
                      child: Image.asset('assets/image.jpeg'),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        initCamera();
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 35.0),
                        height: 270.0,
                        width: 360.0,
                        child: _imageCamera == null
                            ? Container(
                                child: Icon(
                                  Icons.camera_front,
                                  color: Colors.blueAccent,
                                  size: 40.0,
                                ),
                                height: 270.0,
                                width: 340.0,
                              )
                            : AspectRatio(
                                aspectRatio: _cameraController.value.aspectRatio,
                                child: CameraPreview(_cameraController),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
