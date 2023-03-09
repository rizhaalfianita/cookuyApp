import 'package:cookuy/views/resumeIngredient.dart';
import 'package:cookuy/views/scan.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

//import ui
import 'dart:ui' as ui;

ui.Image? iimage;

void getIngredients(BuildContext context) async {
  //create try cacth foimage picker
  try {
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 1000, imageQuality: 40);
    if (pickedFile != null) {
      const mode = DetectionMode.single;
      final options = LocalObjectDetectorOptions(
          mode: mode,
          classifyObjects: false,
          multipleObjects: true,
          modelPath: await _getModel('assets/ml/IngredientDetector.tflite'));
      final objectDetector = ObjectDetector(options: options);

      final List<DetectedObject> objects = await objectDetector
          .processImage(InputImage.fromFilePath(pickedFile.path));

      for (DetectedObject detectedObject in objects) {
        final rect = detectedObject.boundingBox;
        final trackingId = detectedObject.trackingId;
        print("=========ML=======");
        print('rect: $rect');
        print('trackingId: $trackingId');
        print(detectedObject.labels.toString());
        for (Label label in detectedObject.labels) {
          print('===HEHEHEHEH ${label.text} ${label.confidence}');
        }
      }
      await _loadImage(pickedFile);
      ui.Image imgBefore = await converttoImage(pickedFile);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResumeIngredient(
            meals: ["tofu", "salt", "carrot", "cabbage", "onion", "potato"],
            imageAfter: imgBefore,
            objectss: objects);
      }));
    }
  } catch (e) {
    print(e);
  }
}

_loadImage(XFile? file) async {
  final data = await file?.readAsBytes();
  await decodeImageFromList(data!).then((value) => iimage = value);
}

Future<ui.Image> converttoImage(XFile file) async {
  ui.Image? img = null;
  final data = await file.readAsBytes();
  await decodeImageFromList(data).then((value) {
    img = value;
  });
  return img!;
}

Future<String> _getModel(String assetPath) async {
  if (io.Platform.isAndroid) {
    return 'flutter_assets/$assetPath';
  }
  final path = '${(await getApplicationSupportDirectory()).path}/$assetPath';
  await io.Directory(dirname(path)).create(recursive: true);
  final file = io.File(path);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(assetPath);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }
  return file.path;
}
