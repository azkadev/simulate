import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

Future<Uint8List?> screenShotWidget({
  required RenderRepaintBoundary boundary,
}) async {
  ui.Image image = await boundary.toImage();
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  Uint8List pngBytes = byteData!.buffer.asUint8List();

  return pngBytes;
}
