import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:grad/screens/bar.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:grad/main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Try extends StatefulWidget {
  static const String id = 'try';
  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {
  CameraController cameraController;
  XFile vFile;
  XFile iFile;
  bool isLoading = true;
  double _counter = 0;
  Timer _timer;

  void getImage() async {
    File image =
        new File(iFile.path); // Or any other way to get a File instance.
    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    print(decodedImage.width);
    print(decodedImage.height);
  }

  void onVideoRecordButton() {
    cameraController.setFlashMode(FlashMode.off);
    cameraController.startVideoRecording().then((_) {
      if (mounted) setState(() {});
    });
  }

  void onStopVideoRecordButton() {
    cameraController.setFlashMode(FlashMode.off);
    stopVideoRecording().then((file) {
      if (mounted) setState(() {});
      if (file != null) {
        print(file.path);
        vFile = file;
      }
    });
  }

  Future<XFile> stopVideoRecording() async {
    if (cameraController == null || !cameraController.value.isRecordingVideo) {
      return null;
    }
    try {
      return cameraController.stopVideoRecording();
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  void captureImage() {
    cameraController.takePicture().then((file) {
      if (mounted) setState(() {});
      if (file != null) {
        print(file.path);
        iFile = file;
      }
    });
  }

  Future<XFile> takePicture() async {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return null;
    }
    if (cameraController.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print(e);
      return null;
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile file) {
      if (mounted) {
        setState(() {
          iFile = file;
        });
      }
    });
  }

  void startTimer() {
    _counter = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter < 10) {
          _counter++;
        } else if (_counter > 9 && cameraController.value.isRecordingVideo) {
          onStopVideoRecordButton();
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraController = CameraController(cameras[1], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
    if (cameraController.value.isInitialized)
      cameraController.setFlashMode(FlashMode.off);
  }

  @override
  Widget build(BuildContext context) {
    int count = _counter.toInt();
    return Scaffold(
      body: count < 10
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 40.0, 14.0, 30.0),
                  child: Text(
                    'Please put your face inside the Rectangle for 10 seconds',
                    style: TextStyle(
                        fontFamily: 'Cardo',
                        fontSize: 25,
                        color: Color(0xff0c2551),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Center(
                  child: Container(
                    height: 250.0,
                    width: 250.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          bottomLeft: Radius.circular(0.0),
                        ),
                        child: CameraPreview(cameraController)),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 340,
                    height: 25,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(50)),
                    child: Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) => Container(
                            width: 34 * _counter,
                            decoration: BoxDecoration(
                                color: Color(0xff0c2570),
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        Positioned.fill(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                '$count sec',
                                style:
                                    TextStyle(fontSize: 7, color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                Container(
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff0c2551)),
                  child: TextButton(
                    child: Text(
                      'Start Record',
                      style: TextStyle(
                          fontFamily: 'Cardo',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w900),
                    ),
                    onPressed: () {
                      if (cameraController.value.isInitialized) {
                        cameraController.startVideoRecording();
                        startTimer();
                      }
                    },
                  ),
                ),

                // TextButton(onPressed: (){
                //   if(cameraController.value.isInitialized) {
                //     cameraController.startVideoRecording();
                //     startTimer();
                //   }
                // }, child: Icon(Icons.videocam)),
                // Row(
                //   children: [
                //     SizedBox(width: 100.0,),
                //
                //     TextButton(onPressed: (){
                //       cameraController.setFlashMode(FlashMode.torch);
                //       onVideoRecordButton();
                //       }, child: Icon(Icons.videocam)),
                //     SizedBox(width: 40.0,),
                //     TextButton(onPressed: (){
                //       onStopVideoRecordButton();
                //       cameraController.setFlashMode(FlashMode.off);
                //     }, child: Icon(Icons.stop)),
                //     TextButton(onPressed: (){
                //       onTakePictureButtonPressed();
                //     }, child: Icon(Icons.camera)),
                //   ],
                // ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10),
                // Center(
                //   child: CircularPercentIndicator(
                //     radius: 200.0,
                //     lineWidth: 12.0,
                //     backgroundColor: Colors.white,
                //     percent: 0.7,
                //     progressColor:  Color(0xff0c2551),
                //     center: Column(
                //       children: [
                //         SizedBox(height: 75.0,),
                //         SizedBox(width: 60,),
                //         Center(child: Text('80',style: TextStyle(fontSize: 30.0, color: Color(0xff0c2551),
                //         ),)),
                //         Center(child: Text('Normal',
                //           style: TextStyle(
                //               color: Color(0xff0c2551),
                //               fontSize: 30.0,
                //               fontFamily: 'Cardo'
                //           ),)),
                //       ],
                //     ),
                //   ),
                // ),
                Center(
                  child: CircleAvatar(
                    radius: 140,
                    backgroundColor: Color(0xff0c2551),
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 135,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Heart Rate',
                              style: TextStyle(
                                  color: Color(0xff0c2551),
                                  fontSize: 18.0,
                                  fontFamily: 'Cardo',
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 60.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  '76',
                                  style: TextStyle(
                                      fontSize: 60, color: Color(0xff0c2551)),
                                ),
                                SizedBox(
                                  width: 50.0,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 60.0,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage('images/heart.png'),
                                      )),
                                    ),
                                    Text(
                                      'BPM',
                                      style: TextStyle(
                                          color: Color(0xff0c2551),
                                          fontFamily: 'Cardo'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 76.0,
                              width: 170,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/beat.png'))),
                            )
                          ],
                        )),
                  ),
                ),
                Container(
                  height: 60.0,
                  width: double.infinity,
                  color: Color(0xff0c2551),
                  child: Center(
                    child: TextButton(
                      child: Text(
                        'Back to home',
                        style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 30.0,
                            color: Colors.grey[300]),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
