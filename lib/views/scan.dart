import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'dart:ui' as ui;
import '../objectPainter.dart';

class Scan extends StatelessWidget {
  ui.Image imageBefore;
  ui.Image imageAfter;
  List<DetectedObject>? objectss;
  Scan(
      {super.key,
      required this.imageBefore,
      required this.imageAfter,
      required this.objectss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //display imgae from imagebefore
            Image.file(File(imageBefore.toString())),
            FittedBox(
              child: SizedBox(
                width: imageAfter.width.toDouble(),
                height: imageAfter.height.toDouble(),
                child: CustomPaint(
                  painter: ObjectPainter(imageAfter, objectss!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
