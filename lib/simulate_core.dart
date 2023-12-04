// ignore_for_file: use_build_context_synchronously, empty_catches

import 'dart:async';
// import "package:un";
import "package:universal_io/io.dart";

import "package:simulate/ui/ui.dart";

import 'package:device_frame/device_frame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:window_manager/window_manager.dart';
export 'package:device_frame/device_frame.dart';
export 'package:file_picker/file_picker.dart';
import 'package:flutter_hicons/flutter_hicons.dart';

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
  static Future<void> ensureInitialized({
    Size? size,
    bool? center,
    Size? minimumSize,
    Size? maximumSize,
    bool? alwaysOnTop,
    bool? fullScreen,
    Color? backgroundColor,
    bool? skipTaskbar,
    String? title,
    TitleBarStyle? titleBarStyle,
    bool? windowButtonVisibility,
    bool isShowFrame = kDebugMode,
    FutureOr<void> Function(WindowManager windowManager)? onWindowInit,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    bool isSetWindowManager = false;
    bool isSetWindowTransparent = false;
    if (isShowFrame) {
      if (Platform.isAndroid) {
      } else if (Platform.isIOS) {
      } else {
        isSetWindowManager = true;
        isSetWindowTransparent = true;
      }
    } else {
      if (Platform.isAndroid) {
      } else if (Platform.isIOS) {
      } else {
        isSetWindowManager = true;
        isSetWindowTransparent = true;
      }
    }

    if (kIsWeb) {
      isSetWindowManager = false;
      isSetWindowTransparent = false;
    }

    if (isSetWindowTransparent) {
      // await Window.initialize();
      // await Window.setEffect(
      //   effect: WindowEffect.transparent,
      // );
    }

    if (isSetWindowManager) {
      await windowManager.ensureInitialized();

      WindowOptions windowOptions = WindowOptions(
        size: size,
        alwaysOnTop: alwaysOnTop,
        fullScreen: fullScreen,
        center: center,
        backgroundColor: Colors.transparent,
        skipTaskbar: false,
        titleBarStyle: TitleBarStyle.hidden,
        windowButtonVisibility: false,
      );

      await windowManager.waitUntilReadyToShow(windowOptions, () async {
        await windowManager.show();
        await windowManager.focus();

        if (onWindowInit != null) {
          await onWindowInit(windowManager);
        }
      });
    }
  }

  final Widget home;
  final DeviceInfo? deviceDefault;
  final bool isShowFrame;
  final bool isShowTopFrame;
  final Widget Function(
      BuildContext context, Widget home, DeviceInfo deviceInfo)? customView;

  final GlobalKey? allBodyKey;
  final GlobalKey? frameBodyKey;
  final EdgeInsets? paddingFrame;
  const Simulate({
    super.key,
    this.paddingFrame,
    this.allBodyKey,
    this.frameBodyKey,
    required this.home,
    this.customView,
    this.deviceDefault,
    this.isShowFrame = kDebugMode,
    this.isShowTopFrame = true,
  });
  @override
  State<Simulate> createState() => _SimulateState();
}

class _SimulateState extends State<Simulate> {
  late DeviceInfo device = widget.deviceDefault ?? Devices.ios.iPhone13ProMax;
  bool isEnable = true;
  @override
  void initState() {
    super.initState();
  }

  GlobalKey allBodyKey = GlobalKey(debugLabel: "all_body_a");
  GlobalKey frameBodyKey = GlobalKey(debugLabel: "frame_body_a");
  @override
  Widget build(BuildContext context) {
    if (!widget.isShowFrame) {
      return widget.home;
    }
    return RepaintBoundary(
      key: widget.key,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Visibility(
              visible: () {
                if (!widget.isShowTopFrame) {
                  return false;
                }
                if (kIsWeb) {
                  return false;
                }

                if (Platform.isLinux ||
                    Platform.isWindows ||
                    Platform.isMacOS) {
                  return true;
                }

                return false;
              }(),
              child: StatusBarSimulate(
                globalKey: widget.allBodyKey ?? allBodyKey,
                newGlobalKey: widget.frameBodyKey ?? frameBodyKey,
                child: Row(
                  children: [
                    PopupMenuButton(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          device.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      itemBuilder: (BuildContext context) {
                        return [
                          ...Devices.all
                              .map((DeviceInfo deviceInfo) {
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
                              })
                              .toList()
                              .cast<PopupMenuItem>(),
                        ];
                      },
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 0,
                      onPressed: () {
                        setState(() {
                          isEnable = !isEnable;
                        });
                      },
                      child: Icon(
                        (isEnable) ? Icons.toggle_on : Icons.toggle_off,
                        color: (isEnable) ? Colors.blue : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: RepaintBoundary(
                key: widget.frameBodyKey ?? frameBodyKey,
                child: bodyDevice(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bodyDevice() {
    return Padding(
      padding: widget.paddingFrame ?? const EdgeInsets.all(10),
      child: Center(
        child: (isEnable)
            ? DeviceFrame(
                device: device,
                orientation: MediaQuery.of(context).orientation,
                screen: (widget.customView != null)
                    ? widget.customView!.call(context, widget.home, device)
                    : widget.home,
              )
            : widget.home,
      ),
    );
  }
}

class StatusBarSimulate extends StatelessWidget {
  final GlobalKey globalKey;
  final GlobalKey newGlobalKey;
  final Widget child;
  const StatusBarSimulate({
    super.key,
    required this.globalKey,
    required this.newGlobalKey,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
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
        child: DragToMoveArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: child,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          Hicons.camera_1_light_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          onTap: () async {
                            try {
                              String? selectedDirectory =
                                  await FilePicker.platform.getDirectoryPath();

                              if (selectedDirectory != null) {
                                var getPathFile =
                                    "$selectedDirectory/${DateTime.now()}.png";

                                RenderRepaintBoundary boundary =
                                    globalKey.currentContext!.findRenderObject()
                                        as RenderRepaintBoundary;
                                Uint8List? pngBytes =
                                    await screenShotWidget(boundary: boundary);

                                if (pngBytes != null) {
                                  var file = File(getPathFile);
                                  await file.writeAsBytes(pngBytes);
                                }
                              }
                            } catch (e) {}
                          },
                          child: const Text("Screenshot"),
                        ),
                        PopupMenuItem(
                          onTap: () async {
                            try {
                              String? selectedDirectory =
                                  await FilePicker.platform.getDirectoryPath();
                              if (selectedDirectory != null) {
                                var getPathFile =
                                    "$selectedDirectory/${DateTime.now()}.png";

                                RenderRepaintBoundary boundary = newGlobalKey
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;

                                Uint8List? pngBytes =
                                    await screenShotWidget(boundary: boundary);

                                if (pngBytes != null) {
                                  var file = File(getPathFile);
                                  await file.writeAsBytes(pngBytes);
                                }
                              }
                            } catch (e) {}
                          },
                          child: const Text("Screenshot without bar"),
                        ),
                      ];
                    },
                  ),
                  WindowCaptionButton.minimize(
                    brightness: Brightness.dark,
                    onPressed: () async {
                      try {
                        bool isMinimized = await windowManager.isMinimized();
                        if (isMinimized) {
                          await windowManager.restore();
                        } else {
                          await windowManager.minimize();
                        }
                      } catch (e) {}
                    },
                  ),
                  FutureBuilder<bool>(
                    future: () async {
                      try {
                        return windowManager.isMaximized();
                      } catch (e) {
                        return false;
                      }
                    }(),
                    builder:
                        (BuildContext context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.data == true) {
                        return WindowCaptionButton.unmaximize(
                          brightness: Brightness.dark,
                          onPressed: () async {
                            try {
                              await windowManager.unmaximize();
                            } catch (e) {}
                          },
                        );
                      }
                      return WindowCaptionButton.maximize(
                        brightness: Brightness.dark,
                        onPressed: () async {
                          try {
                            await windowManager.maximize();
                          } catch (e) {}
                        },
                      );
                    },
                  ),
                  WindowCaptionButton.close(
                    brightness: Brightness.dark,
                    onPressed: () async {
                      try {
                        await windowManager.close();
                      } catch (e) {}
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
