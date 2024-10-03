//newCameraPakageUtile

// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  //pickImageFromGallery();
                },
                child: const Text(
                  'Take From Gallery',
                )),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  //pickImageFromCamera();
                },
                child: const Text(
                  'Take From Camera',
                )),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text('Please Select Image'),
          ],
        ),
      ),
    );
  }

 

 //Future pickImageFromGallery() async {
   // final retimage = await ImagePicker().pickImage(source: ImageSource.gallery);
   // if (retimage == null) {
   //   return;
   // }
   // setState(() {
   //   _selectedImage = File(retimage.path);
   // });
 // }

  //Future pickImageFromCamera() async {
  //  final retimage = await ImagePicker().pickImage(source: ImageSource.camera);
  //  if (retimage == null) {
//      return;
 //   }
  //  setState(() {
  //    _selectedImage = File(retimage.path);
  //  });
 //}
}

//ading this Line in ios/Runner/info.plist
//<key>NSPhotoLibraryUsageDescription</key>
//<string>Need to upload image</string>
//<key>NSCameraUsageDescription</key>
//<string>Need to upload image</string>
//<key>NSMicrophoneUsageDescription</key>
//<string>Need to upload image</string>
