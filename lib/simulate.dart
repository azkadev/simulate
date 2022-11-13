// ignore_for_file: use_build_context_synchronously, overridden_fields

import 'dart:io';
import 'dart:ui' as ui;

export 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
export 'package:device_frame/device_frame.dart';
export 'package:file_picker/file_picker.dart';

/// simulate part
final buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFF805306),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFF805306),
  iconMouseOver: const Color(0xFF805306),
  iconMouseDown: const Color(0xFFFFD500),
);

/// simulate part
final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: const Color(0xFF805306),
  iconMouseOver: Colors.white,
);

/// simulate part
class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
      };
}

/// simulate part
class Simulate extends StatefulWidget {
  final Widget home;
  final DeviceInfo? deviceDefault;
  final bool isShowFrame;
  final Widget Function(BuildContext context, Widget home, DeviceInfo deviceInfo)? customView;
  const Simulate({
    super.key,
    required this.home,
    this.customView,
    this.deviceDefault,
    this.isShowFrame = kDebugMode,
  });

  @override
  State<Simulate> createState() => _SimulateState();
}

class _SimulateState extends State<Simulate> {
  late DeviceInfo device = Devices.ios.iPhone13ProMax;
  @override
  void initState() {
    super.initState();
    if (widget.deviceDefault != null) {
      setState(() {
        device = widget.deviceDefault!;
      });
    }
  }

  GlobalKey globalKey = GlobalKey();
  GlobalKey newglobalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    if (!widget.isShowFrame) {
      return widget.home;
    }
    return RepaintBoundary(
      key: globalKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                // padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 5,
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: MoveWindow(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PopupMenuButton(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              device.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        itemBuilder: (BuildContext context) {
                          return Devices.all.map((DeviceInfo deviceInfo) {
                            return PopupMenuItem(
                              child: Text(
                                "${deviceInfo.name} ${device.identifier.platform.name}",
                              ),
                              onTap: () {
                                setState(() {
                                  device = deviceInfo.copyWith.call();
                                });
                              },
                            );
                          }).toList();
                        },
                      ),
                      const Spacer(),
                      PopupMenuButton(
                        onSelected: (data) {
                          if (kDebugMode) {
                            print(data);
                          }
                        },
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Iconsax.camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        itemBuilder: (BuildContext context) {
                          return [
                            PopupMenuItem(
                              onTap: () async {
                                String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

                                if (selectedDirectory != null) {
                                  var getPathFile = "$selectedDirectory/${DateTime.now()}.png";

                                  RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

                                  ui.Image image = await boundary.toImage();
                                  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                                  Uint8List pngBytes = byteData!.buffer.asUint8List();
                                  var file = File(getPathFile);
                                  await file.writeAsBytes(pngBytes);
                                }
                              },
                              child: const Text("Screenshot"),
                            ),
                            PopupMenuItem(
                              onTap: () async {
                                String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
                                if (selectedDirectory != null) {
                                  var getPathFile = "$selectedDirectory/${DateTime.now()}.png";

                                  RenderRepaintBoundary boundary = newglobalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

                                  ui.Image image = await boundary.toImage();
                                  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                                  Uint8List pngBytes = byteData!.buffer.asUint8List();
                                  var file = File(getPathFile);
                                  await file.writeAsBytes(pngBytes);
                                }
                              },
                              child: const Text("Screenshot without bar"),
                            ),
                          ];
                        },
                      ),
                      MinimizeWindowButton(colors: buttonColors),
                      MaximizeWindowButton(colors: buttonColors),
                      CloseWindowButton(colors: closeButtonColors),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RepaintBoundary(
              key: newglobalKey,
              child: bodyDevice(),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyDevice() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: DeviceFrame(
          device: device,
          orientation: MediaQuery.of(context).orientation,
          screen: (widget.customView != null) ? widget.customView!.call(context, widget.home, device) : widget.home,
        ),
      ),
    );
  }
}

/// call this function on main app
void initSimulate({
  bool isShowFrame = kDebugMode,
}) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isShowFrame) {
    if (Platform.isAndroid) {
    } else if (Platform.isIOS) {
    } else {
      await Window.initialize();
      await Window.setEffect(
        effect: WindowEffect.transparent,
      );
    }
  } else {
    if (Platform.isAndroid) {
    } else if (Platform.isIOS) {
    } else {
      await Window.initialize();
      await Window.setEffect(
        effect: WindowEffect.transparent,
      );
    }
  }
  if (isShowFrame) {
    if (Platform.isAndroid) {
    } else if (Platform.isIOS) {
    } else {
      doWhenWindowReady(() {
        const initialSize = Size(450, 980);
        appWindow.minSize = const Size(350, 350);
        appWindow.size = initialSize;
        appWindow.alignment = Alignment.center;
        appWindow.show();
      });
    }
  } else {
    if (Platform.isAndroid) {
    } else if (Platform.isIOS) {
    } else {
      doWhenWindowReady(() {
        const initialSize = Size(450, 980);
        appWindow.minSize = const Size(350, 350);
        appWindow.size = initialSize;
        appWindow.alignment = Alignment.center;
        appWindow.show();
      });
    }
  }
}
