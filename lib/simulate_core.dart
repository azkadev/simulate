// ignore_for_file: unnecessary_string_interpolations

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

import 'dart:async';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:simulate/simulate_status_bar.dart';
import "package:universal_io/io.dart";

import 'package:flutter/material.dart';
// import 'package:flutter_acrylic/flutter_acrylic.dart';

import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
export 'package:device_frame/device_frame.dart';
export 'package:file_picker/file_picker.dart';
import "package:system_info_fetch/system_info_fetch.dart";

class SimulateData extends ChangeNotifier {
  bool is_simulate = (kDebugMode);
  bool is_show_status_bar = true;
  bool is_show_navigation_bar = true;
  bool is_show_full_operating_system = false;

  GlobalKey global_status_bar = GlobalKey();
  GlobalKey global_home_widget = GlobalKey();

  bool isSimulateUpdate() {
    is_simulate = (!is_simulate);
    notifyListeners();
    return is_simulate;
  }
}

/// simulate part
class Simulate extends StatefulWidget {
  final Widget home;
  final GeneralLibFlutterApp generalLibFlutterApp;
  final DeviceInfo? deviceDefault;
  final bool isShowExperimental;
  final bool isShowFrame;
  final bool isShowTopFrame;
  final Widget Function(
      BuildContext context, Widget home, DeviceInfo deviceInfo)? customView;

  final GlobalKey? allBodyKey;
  final GlobalKey? frameBodyKey;
  final EdgeInsets? paddingFrame;
  const Simulate({
    super.key,
    required this.generalLibFlutterApp,
    this.isShowExperimental = false,
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

  static SimulateData simulate_data = SimulateData();

  static Future<void> ensureInitialized({
    bool? isSimulate,
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
    if (isSimulate != null) {
      simulate_data.is_simulate = isSimulate;
    }
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
}

class _SimulateState extends State<Simulate> {
  DeviceInfo device = Devices.ios.iPhone13ProMax;
  bool is_loading_complete = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        device = widget.deviceDefault ?? Devices.ios.iPhone13ProMax;
        is_loading_complete = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  GlobalKey allBodyKey = GlobalKey(debugLabel: "all_body_a");
  GlobalKey frameBodyKey = GlobalKey(debugLabel: "frame_body_a");

  @override
  Widget build(BuildContext context) {
    if (!widget.isShowFrame) {
      return widget.home;
    }
    // RepaintBoundary repaintBoundary =
    return ListenableBuilder(
      listenable: Simulate.simulate_data,
      builder: (context, child) {
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
                    generalLibFlutterApp: widget.generalLibFlutterApp,
                    globalKey: widget.allBodyKey ?? allBodyKey,
                    newGlobalKey: widget.frameBodyKey ?? frameBodyKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: PopupMenuButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                () {
                                  if (Simulate.simulate_data.is_simulate) {
                                    return "${device.name} ${device.identifier.platform.name}";
                                  }
                                  return "${SystemInfoFetch.get_model ?? "Unknown Device"}"
                                      .trim();
                                }(),
                                style: TextStyle(
                                  color: context.theme.indicatorColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            // surfaceTintColor: context.theme.indicatorColor,
                            itemBuilder: (BuildContext context) {
                              return Devices.all.map((DeviceInfo deviceInfo) {
                                return PopupMenuItem(
                                  child: Text(
                                    "${deviceInfo.name} ${deviceInfo.identifier.platform.name.replaceFirstMapped(RegExp("^(.)"), (match) {
                                      return (match.group(1) ?? "")
                                          .toUpperCase();
                                    })}",
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
                        ),
                        // const Spacer(),
                        MaterialButton(
                          minWidth: 0,
                          onPressed: () {
                            Simulate.simulate_data.isSimulateUpdate();
                          },
                          child: Icon(
                            (Simulate.simulate_data.is_simulate)
                                ? Icons.toggle_on
                                : Icons.toggle_off,
                            color: (Simulate.simulate_data.is_simulate)
                                ? Colors.blue
                                : context.theme.indicatorColor,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () {
                                widget.generalLibFlutterApp.autoChangeTheme(
                                  onChangeBrightness: () {
                                    return context
                                        .mediaQueryData.platformBrightness;
                                  },
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                () {
                                  if (widget.generalLibFlutterApp.themeMode ==
                                      ThemeMode.dark) {
                                    return Icons.dark_mode;
                                  }
                                  if (widget.generalLibFlutterApp.themeMode ==
                                      ThemeMode.light) {
                                    return Icons.light_mode;
                                  }
                                  // return AntDesign.dark;
                                  // return Clarity.dark;
                                  return Icons.auto_mode;
                                }(),
                              ),
                            );
                          },
                        ),
                        PopupMenuButton(
                          position: PopupMenuPosition.under,
                          tooltip: "Settings",
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                // Hicons.setting_light_outline,
                                Clarity.settings_line,
                                color: context.theme.indicatorColor,
                              ),
                            ),
                          ),
                          itemBuilder: (BuildContext context) {
                            return [
                              const PopupMenuItem(
                                child: Text("Thme "),
                              ),
                            ];
                          },
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
      },
    );
    // return repaintBoundary;
  }

  Widget bodyDevice() {
    return Padding(
      padding: widget.paddingFrame ?? const EdgeInsets.all(10),
      child: Center(
        child: () {
          if (Simulate.simulate_data.is_simulate) {
            if (is_loading_complete == false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return DeviceFrame(
              device: device,
              orientation: MediaQuery.of(context).orientation,
              screen: () {
                Function? customView = widget.customView;
                if (customView != null) {
                  return customView(context, widget.home, device);
                }
                if (widget.isShowExperimental == false) {
                  return widget.home;
                }
                if ([
                  TargetPlatform.linux,
                  TargetPlatform.macOS,
                  TargetPlatform.windows,
                ].contains(device.identifier.platform)) {
                  return widget.home;
                }
                double pding = ((Simulate.simulate_data.global_home_widget
                            .sizeRenderBox()
                            .width /
                        2) /
                    2);
                if (pding <= 0) {
                  pding = ((context.width / 2.5) / 2);
                }
                return Stack(
                  children: [
                    Positioned.fill(
                      key: Simulate.simulate_data.global_home_widget,
                      child: MediaQuery(
                        data: context.mediaQueryData.copyWith(
                          padding: context.mediaQueryData.padding.copyWith(
                            top: Simulate.simulate_data.global_status_bar
                                    .sizeRenderBox()
                                    .height +
                                context.mediaQueryData.padding.top,
                            bottom: Simulate.simulate_data.global_status_bar
                                    .sizeRenderBox()
                                    .height +
                                context.mediaQueryData.padding.top,
                          ),
                        ),
                        child: widget.home,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      top: 5,
                      child: Padding(
                        key: Simulate.simulate_data.global_status_bar,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${DateTime.now().hour}:${DateTime.now().minute}",
                                  style: TextStyle(
                                    color: context.theme.indicatorColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Icon(
                                          BoxIcons.bxl_telegram,
                                          color: context.theme.indicatorColor,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Icon(
                                          BoxIcons.bxl_whatsapp,
                                          color: context.theme.indicatorColor,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Icon(
                                          BoxIcons.bxl_snapchat,
                                          color: context.theme.indicatorColor,
                                          size: 15,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Icon(
                                          BoxIcons.bxl_tiktok,
                                          color: context.theme.indicatorColor,
                                          size: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox.shrink(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Bootstrap.wifi,
                                  color: context.theme.indicatorColor,
                                ),
                                Icon(
                                  Icons.signal_cellular_4_bar_rounded,
                                  color: context.theme.indicatorColor,
                                ),
                                Icon(
                                  Bootstrap.battery_half,
                                  color: context.theme.indicatorColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: pding,
                      left: pding,
                      bottom: 5,
                      child: Container(
                        height: 6,
                        // width: ,
                        decoration: BoxDecoration(
                          // color: Colors.grey,

                          color: context.theme.indicatorColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                );
              }(),
            );
          }

          return widget.home;
        }(),
      ),
    );
  }
}
