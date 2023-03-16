import 'dart:io';

import 'package:cookuy/views/resumeIngredient.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
// import tflite
import 'package:image/image.dart' as img;
//import ui
import 'dart:ui' as ui;

ui.Image? iimage;
// List<dynamic>? _recognitions;

//   Future<void> loadModel() async {
//     try {
//       String res = await Tflite.loadModel(
//         model: 'assets/ssd_mobilenet_v1.tflite',
//         labels: 'assets/ssd_mobilenet_v1.txt',
//       );
//       print('loadModel: $res');
//     } catch (e) {
//       print('Error loading model: $e');
//     }
//   }

//   Future<void> predict(io.File imageFile) async {
//     try {
//       Uint8List imageBytes = await imageFile.readAsBytes();
//       var recognitions = await Tflite.detectObjectOnBinary(
//         binary: imageBytes,
//         threshold: 0.5,
//         numResultsPerClass: 1,
//       );

//         _recognitions = recognitions;

//     } catch (e) {
//       print('Error predicting: $e');
//     }
//   }

// normalizeImage(Uint8List imageBytes) {
Future<img.Image> _normalizeImage(File file) async {
  final imageBytes = await file.readAsBytes();
  var image = img.decodeImage(imageBytes)!;
  // Normalize image here with std and mean
  final mean = [0.485, 0.456, 0.406];
  final std = [0.229, 0.224, 0.225];

  // resize image to 300x300
  image = img.copyResize(image, width: 300, height: 300);
  final normalizedImage = img.normalize(image, min: -1, max: 1);
  return normalizedImage;
}

void getIngredients(BuildContext context) async {
  //create try cacth foimage picker
  try {
    var pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera, maxHeight: 1000, imageQuality: 40);
    if (pickedFile != null) {
      //normalize image
      // final normalizedImage = await _normalizeImage(File(pickedFile.path));
      // //convert to input image
      // final inputImage = InputImage.fromBytes(
      //     bytes: img.encodeJpg(normalizedImage),
      //     inputImageData: InputImageData(
      //         size: Size(normalizedImage.width.toDouble(),
      //             normalizedImage.height.toDouble()),
      //         imageRotation: InputImageRotation.rotation0deg,
      //         inputImageFormat: InputImageFormatValue.fromRawValue(1)!,
      //         planeData: [
      //           InputImagePlaneMetadata(
      //               bytesPerRow: normalizedImage.width * 4,
      //               height: normalizedImage.height,
      //               width: normalizedImage.width)
      //         ]));

      const mode = DetectionMode.single;
      final options = LocalObjectDetectorOptions(
          mode: mode,
          classifyObjects: false,
          multipleObjects: true,
          modelPath: await _getModel('assets/ml/salad_efficient1.tflite'));
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
