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
import 'package:flutter/cupertino.dart';
import 'package:general_lib/general_lib.dart';
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

  final GlobalKey global_status_bar = GlobalKey();
  final GlobalKey global_bottom_bar = GlobalKey();
  final GlobalKey global_home_widget = GlobalKey();

  void Function() onUpdate = () {};

  bool isSimulateUpdate() {
    is_simulate = (!is_simulate);
    notifyListeners();
    onUpdate();
    return is_simulate;
  }
}

class SimulateApp extends StatefulWidget {
  final Widget home;
  final GeneralLibFlutterApp generalLibFlutterApp;
  const SimulateApp({
    super.key,
    required this.home,
    required this.generalLibFlutterApp,
  });

  @override
  State<SimulateApp> createState() => _SimulateAppState();
}

class _SimulateAppState extends State<SimulateApp> {
  DeviceInfo device = Devices.android.samsungGalaxyNote20Ultra;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      task();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void task() {
    setState(() {});
    Future(() async {
      setState(() {});
    });
  }

  final GlobalKey globalKey = GlobalKey();

  final GlobalKey new_global_key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      body: RepaintBoundary(
              key: globalKey,
              child:  Column(
        children: [
          StatusBarSimulate(
            generalLibFlutterApp: widget.generalLibFlutterApp,
            globalKey: globalKey,
            newGlobalKey: new_global_key,
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
                          return "${SystemInfoFetch.get_model ?? "Unknown Device"}".trim();
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
                              return (match.group(1) ?? "").toUpperCase();
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
                    (Simulate.simulate_data.is_simulate) ? Icons.toggle_on : Icons.toggle_off,
                    color: (Simulate.simulate_data.is_simulate) ? Colors.blue : context.theme.indicatorColor,
                  ),
                ),
                Builder(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        widget.generalLibFlutterApp.autoChangeTheme(
                          onChangeBrightness: () {
                            return context.mediaQueryData.platformBrightness;
                          },
                        );
                        setState(() {});
                      },
                      icon: Icon(
                        () {
                          if (widget.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                            return Icons.dark_mode;
                          }
                          if (widget.generalLibFlutterApp.themeMode == ThemeMode.light) {
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
          Expanded(
            child:RepaintBoundary(
              key: new_global_key,
              child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.indicatorColor,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: context.theme.shadowColor.withAlpha(110),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return MediaQuery(
                          data: context.mediaQueryData.copyWith(size: constraints.biggest),
                          child: widget.home,
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Simulate(
                    paddingFrame: EdgeInsets.all(5),
                    generalLibFlutterApp: widget.generalLibFlutterApp,
                    alignment: Alignment.topCenter,
                    isShowExperimental: true,
                    orientation: Orientation.portrait,
                    isShowTopFrame: false,
                    home: widget.home,
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
      ),
    );
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
  final Widget Function(BuildContext context, Widget home, DeviceInfo deviceInfo)? customView;

  final GlobalKey? allBodyKey;
  final GlobalKey? frameBodyKey;
  final EdgeInsets? paddingFrame;
  final Orientation? orientation;
  final AlignmentGeometry alignment;
  const Simulate({
    super.key,
    required this.generalLibFlutterApp,
    this.alignment = Alignment.center,
    this.orientation,
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

  static Future<void> setTitleBarVisibility({
    bool visibility = false,
    bool windowButtonVisibility = false,
  }) async {
    if (Dart.isDesktop == false) {
      return;
    }
    if (Dart.isWeb) {
      return;
    }

    await windowManager.setTitleBarStyle(visibility ? TitleBarStyle.normal : TitleBarStyle.hidden, windowButtonVisibility: windowButtonVisibility);
  }
}

class _SimulateState extends State<Simulate> {
  DeviceInfo device = Devices.android.samsungGalaxyNote20Ultra;
  bool is_loading_complete = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      task();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void task() {
    setState(() {});
    Future(() async {
      setState(() {
        device = widget.deviceDefault ?? Devices.android.samsungGalaxyNote20Ultra;
        is_loading_complete = true;
      });
      await Future.delayed(Durations.short1);
      setState(() {});
    });
  }

  final GlobalKey allBodyKey = GlobalKey(debugLabel: "all_body_a");
  final GlobalKey frameBodyKey = GlobalKey(debugLabel: "frame_body_a");

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

                    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
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
                                  return "${SystemInfoFetch.get_model ?? "Unknown Device"}".trim();
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
                                      return (match.group(1) ?? "").toUpperCase();
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
                            (Simulate.simulate_data.is_simulate) ? Icons.toggle_on : Icons.toggle_off,
                            color: (Simulate.simulate_data.is_simulate) ? Colors.blue : context.theme.indicatorColor,
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            return IconButton(
                              onPressed: () {
                                widget.generalLibFlutterApp.autoChangeTheme(
                                  onChangeBrightness: () {
                                    return context.mediaQueryData.platformBrightness;
                                  },
                                );
                                setState(() {});
                              },
                              icon: Icon(
                                () {
                                  if (widget.generalLibFlutterApp.themeMode == ThemeMode.dark) {
                                    return Icons.dark_mode;
                                  }
                                  if (widget.generalLibFlutterApp.themeMode == ThemeMode.light) {
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
      child: Align(
        alignment: widget.alignment,
        child: () {
          if (Simulate.simulate_data.is_simulate) {
            if (is_loading_complete == false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return DeviceFrame(
                device: device,
                orientation: widget.orientation ?? MediaQuery.of(context).orientation,
                screen: Builder(
                  builder: (context) {
                    final Function? customView = widget.customView;
                    if (customView != null) {
                      return MediaQuery(
                        data: context.mediaQueryData.copyWith(
                          size: Size(context.width, context.height),
                        ),
                        child: customView(context, widget.home, device),
                      );
                    }
                    if (widget.isShowExperimental == false) {
                      return MediaQuery(
                        data: context.mediaQueryData.copyWith(
                          size: Size(context.width, context.height),
                        ),
                        child: widget.home,
                      );
                    }
                    if ([
                      TargetPlatform.linux,
                      TargetPlatform.macOS,
                      TargetPlatform.windows,
                    ].contains(device.identifier.platform)) {
                      return MediaQuery(
                        data: context.mediaQueryData.copyWith(
                          size: Size(context.width, context.height),
                        ),
                        child: widget.home,
                      );
                    }
                    double pding = ((Simulate.simulate_data.global_home_widget.sizeRenderBox().width / 2) / 2);
                    if (pding <= 0) {
                      pding = ((context.width / 2.5) / 2);
                    }

                    return Stack(
                      children: [
                        Positioned.fill(
                          key: Simulate.simulate_data.global_home_widget,
                          child: MediaQuery(
                            data: context.mediaQueryData.copyWith(
                              size: Size(context.width, context.height),
                              // padding: context.mediaQueryData.padding.copyWith(
                              //   top: Simulate.simulate_data.global_status_bar.sizeRenderBox().height + context.mediaQueryData.padding.top,
                              //   bottom: Simulate.simulate_data.global_bottom_bar.sizeRenderBox().height + context.mediaQueryData.padding.bottom,
                              //   right: context.mediaQueryData.padding.right,
                              //   left: context.mediaQueryData.padding.left,
                              // ),
                              // viewPadding: context.mediaQueryData.padding.copyWith(
                              //   top: Simulate.simulate_data.global_status_bar.sizeRenderBox().height + context.mediaQueryData.padding.top,
                              //   bottom: Simulate.simulate_data.global_bottom_bar.sizeRenderBox().height + context.mediaQueryData.padding.bottom,
                              //   right: context.mediaQueryData.padding.right,
                              //   left: context.mediaQueryData.padding.left,
                              // ),
                            ),
                            child: widget.home,
                          ),
                        ),
                        Positioned(
                          left: 10,
                          right: 10,
                          top: 5,
                          child: Builder(
                            key: Simulate.simulate_data.global_status_bar,
                            builder: (context) {
                              return Padding(
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
                                          "${DateTime.now().hour}.${DateTime.now().minute}",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: context.theme.indicatorColor,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(1),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                                child: Icon(
                                                  BoxIcons.bxl_telegram,
                                                  color: context.theme.indicatorColor,
                                                  size: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                                child: Icon(
                                                  BoxIcons.bxl_whatsapp,
                                                  color: context.theme.indicatorColor,
                                                  size: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 1),
                                                child: Icon(
                                                  BoxIcons.bxl_snapchat,
                                                  color: context.theme.indicatorColor,
                                                  size: 15,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 1),
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
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          child: Icon(
                                            CupertinoIcons.wifi,
                                            color: context.theme.indicatorColor,
                                            size: 15,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          child: Icon(
                                            Icons.signal_cellular_4_bar_rounded,
                                            color: context.theme.indicatorColor,
                                            size: 15,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          child: Icon(
                                            CupertinoIcons.battery_full,
                                            color: context.theme.indicatorColor,
                                            size: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: pding,
                          left: pding,
                          bottom: 5,
                          child: Builder(
                            key: Simulate.simulate_data.global_bottom_bar,
                            builder: (context) {
                              return Container(
                                height: 6,
                                // width: ,
                                decoration: BoxDecoration(
                                  // color: Colors.grey,
                                  color: context.theme.indicatorColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ));
          }

          return widget.home;
        }(),
      ),
    );
  }
}
