import 'dart:async';
import 'dart:io';
import'package:native_video_view/native_video_view.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:grad/main.dart';


class CameraAccess extends StatefulWidget {
  static const String id = 'camera';
  @override
  _CameraAccessState createState() => _CameraAccessState();
}

class _CameraAccessState extends State<CameraAccess> {
  CameraController cameraController;
  XFile vFile;
  XFile iFile;
  int iWidth = 0;
  int iHeight= 0;
  double _counter = 0;
  Timer _timer ;

  void getImage() async{
    File image = new File(iFile.path); // Or any other way to get a File instance.
    var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    iHeight = decodedImage.height;
    iWidth = decodedImage.width;
    print(decodedImage.width);
    print(decodedImage.height);
  }

  void onVideoRecordButton(){
    cameraController.startVideoRecording().then((_) {
      if(mounted) setState(() {});
    });
  }

  void onStopVideoRecordButton(){
    cameraController.setFlashMode(FlashMode.off);
    stopVideoRecording().then((file) {
      if(mounted) setState(() {});
      if(file!=null){
        print(file.path);
        vFile = file;
      }
    });
  }

  Future<XFile> stopVideoRecording() async{
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
  void captureImage(){
    cameraController.takePicture().then((file) {
      if(mounted) setState(() {});
      if(file!=null){
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
  void startTimer(){
    _counter = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter<10){
          _counter++;
        } else if(_counter >9 && cameraController.value.isRecordingVideo){
          onStopVideoRecordButton();
        }else {
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
      if(!mounted) return;
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: vFile==null?
      Column(
        children: [
          SizedBox(height: 50.0,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Please put your face inside the circle for 10 seconds',style: TextStyle(
                fontFamily: 'Cardo',
                fontSize: 25,
                color: Color(0xff0c2551),
                fontWeight: FontWeight.w900
            ),),
          ),
          SizedBox(height: 30.0,),
          Center(
            child: Container(
              height: 200.0,
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
          SizedBox(height: 30.0,),
          Row(
            children: [
              Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xff0c2551)
                ),
                child: TextButton(
                  child: Text('Start Record', style: TextStyle(
                      fontFamily: 'Cardo',
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w900
                  ),),
                  onPressed: (){
                    if(cameraController.value.isInitialized) {
                      cameraController.startVideoRecording();
                      startTimer();
                    }
                  },
                ),
              ),
              TextButton(
                child: Text('stop', style: TextStyle(
                    fontFamily: 'Cardo',
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w900
                ),),
                onPressed: (){
                  captureImage();
                  onStopVideoRecordButton();
                  },
              ),
            ],
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
          Row(
            children: [
              TextButton(onPressed: ()async{
                int length = await vFile.length();
                if(vFile==null) {
                  print('failed');
                } else {
                  print('${length/(1024*1024)}');
                }
              }, child: Icon(Icons.gamepad)),
              TextButton(onPressed: (){
                if(cameraController.value.isRecordingVideo){
                  print('shit');
                } else{
                  print('done');
                }
              }, child: Icon(Icons.games_outlined)),
            ],
          ),
        ],
      ) :
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Text('video size is ${vFile.length()}')
              ],
            ),
          ),
          NativeVideoView(
            keepAspectRatio: true,
            showMediaController: true,
            onCreated: (controller){
              controller.setVideoSource(vFile.path,sourceType: VideoSourceType.file);
            },
            onPrepared: (controller, info){
              controller.play();
            },
            onError: (controller, what, extra, message) {
              print('Player Error ($what | $extra | $message)');
            },
            onCompletion: (controller) {
              print('Video completed');
            },
            onProgress: (progress, duration) {
              print('$progress | $duration');
            },
          ),
          TextButton(
            child: Text('press'),
            onPressed: (){
              setState(() {
              });
            },),
        ],
      ),
    );
  }
}



//
// import 'dart:async';
// import 'dart:io';
// import'package:native_video_view/native_video_view.dart';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:grad/main.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// class CameraAccess extends StatefulWidget {
//   static const String id = 'camera';
//   @override
//   _CameraAccessState createState() => _CameraAccessState();
// }
//
// class _CameraAccessState extends State<CameraAccess> {
//   CameraController cameraController;
//   XFile vFile;
//   XFile iFile;
//   int iWidth = 0;
//   int iHeight= 0;
//   double _counter = 0;
//   Timer _timer ;
//   bool loading = false;
//
//
//   void getImage() async{
//     File image = new File(iFile.path); // Or any other way to get a File instance.
//     var decodedImage = await decodeImageFromList(image.readAsBytesSync());
//     iHeight = decodedImage.height;
//     iWidth = decodedImage.width;
//     print(decodedImage.width);
//     print(decodedImage.height);
//   }
//
//   void onVideoRecordButton(){
//     cameraController.startVideoRecording().then((_) {
//       if(mounted) setState(() {});
//     });
//   }
//
//   void onStopVideoRecordButton(){
//     cameraController.setFlashMode(FlashMode.off);
//     stopVideoRecording().then((file) {
//       if(mounted) setState(() {});
//       if(file!=null){
//         print(file.path);
//         vFile = file;
//       }
//     });
//   }
//
//   Future<XFile> stopVideoRecording() async{
//     if (cameraController == null || !cameraController.value.isRecordingVideo) {
//       return null;
//     }
//     try {
//       return cameraController.stopVideoRecording();
//     } on CameraException catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   void captureImage(){
//     cameraController.takePicture().then((file) {
//       if(mounted) setState(() {});
//       if(file!=null){
//         print(file.path);
//         iFile = file;
//       }
//     });
//   }
//
//   Future<XFile> takePicture() async {
//     if (cameraController == null || !cameraController.value.isInitialized) {
//       return null;
//     }
//     if (cameraController.value.isTakingPicture) {
//       // A capture is already pending, do nothing.
//       return null;
//     }
//
//     try {
//       XFile file = await cameraController.takePicture();
//       return file;
//     } on CameraException catch (e) {
//       print(e);
//       return null;
//     }
//   }
//
//   void onTakePictureButtonPressed() {
//     takePicture().then((XFile file) {
//       if (mounted) {
//         setState(() {
//           iFile = file;
//         });
//       }
//     });
//   }
//
//   void startTimer(){
//     _counter = 0;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if(_counter<10){
//           _counter++;
//         } else if(_counter >9 && cameraController.value.isRecordingVideo){
//           onStopVideoRecordButton();
//         }else {
//           _timer.cancel();
//         }
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     cameraController = CameraController(cameras[1], ResolutionPreset.low);
//     cameraController.initialize().then((value) {
//       if(!mounted) return;
//       setState(() {});
//     });
//   }
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: vFile==null?
//       Column(
//         children: [
//           SizedBox(height: 50.0,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text('Please put your face inside the circle for 10 seconds',style: TextStyle(
//                 fontSize: 25,
//                 color: Color(0xff0c2551),
//                 fontWeight: FontWeight.w900
//             ),),
//           ),
//           SizedBox(height: 30.0,),
//           Center(
//             child: Container(
//               height: 200.0,
//               width: 250.0,
//               child: ClipRRect(
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(0.0),
//                     topRight: Radius.circular(0.0),
//                     bottomRight: Radius.circular(0.0),
//                     bottomLeft: Radius.circular(0.0),
//                   ),
//                   child: CameraPreview(cameraController)),
//             ),
//           ),
//           SizedBox(height: 30.0,),
//           Row(
//             children: [
//               Container(
//                 height: 60,
//                 width: 180,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(40),
//                     color: Color(0xff0c2551)
//                 ),
//                 child: TextButton(
//                   child: Text('Start Record', style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w900
//                   ),),
//                   onPressed: (){
//                     if(cameraController.value.isInitialized) {
//                       cameraController.startVideoRecording();
//                       startTimer();
//                     }
//                   },
//                 ),
//               ),
//               TextButton(
//                 child: Text('stop', style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w900
//                 ),),
//                 onPressed: (){
//                   captureImage();
//                   onStopVideoRecordButton();
//                 },
//               ),
//             ],
//           ),
//           // TextButton(onPressed: (){
//           //   if(cameraController.value.isInitialized) {
//           //     cameraController.startVideoRecording();
//           //     startTimer();
//           //   }
//           // }, child: Icon(Icons.videocam)),
//           // Row(
//           //   children: [
//           //     SizedBox(width: 100.0,),
//           //
//           //     TextButton(onPressed: (){
//           //       cameraController.setFlashMode(FlashMode.torch);
//           //       onVideoRecordButton();
//           //       }, child: Icon(Icons.videocam)),
//           //     SizedBox(width: 40.0,),
//           //     TextButton(onPressed: (){
//           //       onStopVideoRecordButton();
//           //       cameraController.setFlashMode(FlashMode.off);
//           //     }, child: Icon(Icons.stop)),
//           //     TextButton(onPressed: (){
//           //       onTakePictureButtonPressed();
//           //     }, child: Icon(Icons.camera)),
//           //   ],
//           // ),
//           Row(
//             children: [
//               TextButton(onPressed: ()async{
//                 int length = await vFile.length();
//                 if(vFile==null) {
//                   print('failed');
//                 } else {
//                   print('${length/(1024*1024)}');
//                 }
//               }, child: Icon(Icons.gamepad)),
//               TextButton(onPressed: (){
//                 if(cameraController.value.isRecordingVideo){
//                   print('shit');
//                 } else{
//                   print('done');
//                 }
//               }, child: Icon(Icons.games_outlined)),
//             ],
//           ),
//         ],
//       ) :
//       Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(40.0),
//             child: Row(
//               children: [
//                 Text('video size is ${vFile.length()}')
//               ],
//             ),
//           ),
//           NativeVideoView(
//             keepAspectRatio: true,
//             showMediaController: true,
//             onCreated: (controller){
//               controller.setVideoSource(vFile.path,sourceType: VideoSourceType.file);
//             },
//             onPrepared: (controller, info){
//               controller.play();
//             },
//             onError: (controller, what, extra, message) {
//               print('Player Error ($what | $extra | $message)');
//             },
//             onCompletion: (controller) {
//               print('Video completed');
//             },
//             onProgress: (progress, duration) {
//               print('$progress | $duration');
//             },
//           ),
//           TextButton(
//             child: Text('download'),
//             onPressed: (){
//               setState(() {
//                 print(vFile.path);
//               });
//             },)
//         ],
//       ),
//     );
//   }
// }
//
