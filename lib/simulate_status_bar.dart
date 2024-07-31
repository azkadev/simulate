// ignore_for_file: unnecessary_brace_in_string_interps

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: use_build_context_synchronously, empty_catches, non_constant_identifier_names

// import "package:un";
// import 'dart:js';

import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import "package:universal_io/io.dart";

import 'package:flutter/material.dart';
// import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:window_manager/window_manager.dart';
export 'package:device_frame/device_frame.dart';
export 'package:file_picker/file_picker.dart';

class StatusBarSimulate extends StatelessWidget {
  final GlobalKey globalKey;
  final GlobalKey newGlobalKey;
  final Widget child;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const StatusBarSimulate({
    super.key,
    required this.generalLibFlutterApp,
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
          color: context.theme.scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: context.theme.shadowColor.withAlpha(110),
              spreadRadius: 2,
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
                    position: PopupMenuPosition.under,
                    tooltip: "Screenshot",
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Bootstrap.camera,
                          color: context.theme.indicatorColor,
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
                                    "${selectedDirectory}/${DateTime.now()}.png";

                                Uint8List? pngBytes =
                                    await globalKey.toImagePng();
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
                                    "${selectedDirectory}/${DateTime.now()}.png";
                                Uint8List? pngBytes =
                                    await newGlobalKey.toImagePng();

                                if (pngBytes != null) {
                                  var file = File(getPathFile);
                                  await file.writeAsBytes(pngBytes);
                                } else {
                                  context.showSnackBar(
                                      "Maaf Gagal membuat Image Ke Png");
                                }
                              }
                            } catch (e) {
                              if (kDebugMode) {
                                print(e);
                              }
                            }
                          },
                          child: const Text("Screenshot without bar"),
                        ),
                      ];
                    },
                  ),
                  WindowCaptionButton.minimize(
                    brightness: platformBrightness(context: context),
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
                          brightness: platformBrightness(context: context),
                          onPressed: () async {
                            try {
                              await windowManager.unmaximize();
                            } catch (e) {}
                          },
                        );
                      }
                      return WindowCaptionButton.maximize(
                        brightness: platformBrightness(context: context),
                        onPressed: () async {
                          try {
                            await windowManager.maximize();
                          } catch (e) {}
                        },
                      );
                    },
                  ),
                  WindowCaptionButton.close(
                    brightness: platformBrightness(context: context),
                    onPressed: () async {
                      context.theme;
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

  Brightness platformBrightness({
    required BuildContext context,
  }) {
    if (generalLibFlutterApp.themeMode == ThemeMode.dark) {
      return Brightness.dark;
    }
    if (generalLibFlutterApp.themeMode == ThemeMode.light) {
      return Brightness.light;
    }
    return context.mediaQueryData.platformBrightness;
  }
}
