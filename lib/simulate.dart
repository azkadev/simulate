// ignore_for_file: use_build_context_synchronously

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

final buttonColors = WindowButtonColors(
  iconNormal: const Color(0xFF805306),
  mouseOver: const Color(0xFFF6A00C),
  mouseDown: const Color(0xFF805306),
  iconMouseOver: const Color(0xFF805306),
  iconMouseDown: const Color(0xFFFFD500),
);

final closeButtonColors = WindowButtonColors(
  mouseOver: const Color(0xFFD32F2F),
  mouseDown: const Color(0xFFB71C1C),
  iconNormal: const Color(0xFF805306),
  iconMouseOver: Colors.white,
);

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

void autoSimulateApp({
  Key? key,
  GlobalKey<NavigatorState>? navigatorKey,
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  required Widget home,
  Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{},
  String? initialRoute,
  Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
  List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
  Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
  Widget Function(BuildContext, Widget?)? builder,
  String title = '',
  String Function(BuildContext)? onGenerateTitle,
  Color? color,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeData? highContrastTheme,
  ThemeData? highContrastDarkTheme,
  ThemeMode? themeMode = ThemeMode.system,
  Locale? locale,
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
  Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback,
  Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
  bool debugShowMaterialGrid = false,
  bool showPerformanceOverlay = false,
  bool checkerboardRasterCacheImages = false,
  bool checkerboardOffscreenLayers = false,
  bool showSemanticsDebugger = false,
  bool debugShowCheckedModeBanner = true,
  Map<ShortcutActivator, Intent>? shortcuts,
  Map<Type, Action<Intent>>? actions,
  String? restorationScopeId,
  ScrollBehavior? scrollBehavior,
  bool useInheritedMediaQuery = false,
  bool isShowFrame = kDebugMode,
}) async {
  scrollBehavior ??= MyScrollBehavior();
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
      runApp(MaterialApp(
        key: key,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: home,
        routes: routes,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onUnknownRoute: onUnknownRoute,
        navigatorObservers: navigatorObservers,
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
        color: color,
        theme: theme,
        darkTheme: darkTheme,
        highContrastTheme: highContrastTheme,
        highContrastDarkTheme: highContrastDarkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        debugShowMaterialGrid: debugShowMaterialGrid,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        shortcuts: shortcuts,
        actions: actions,
        restorationScopeId: restorationScopeId,
        scrollBehavior: scrollBehavior,
        useInheritedMediaQuery: useInheritedMediaQuery,
      ));
    } else if (Platform.isIOS) {
      runApp(MaterialApp(
        key: key,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        home: home,
        routes: routes,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onUnknownRoute: onUnknownRoute,
        navigatorObservers: navigatorObservers,
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
        color: color,
        theme: theme,
        darkTheme: darkTheme,
        highContrastTheme: highContrastTheme,
        highContrastDarkTheme: highContrastDarkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        debugShowMaterialGrid: debugShowMaterialGrid,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        shortcuts: shortcuts,
        actions: actions,
        restorationScopeId: restorationScopeId,
        scrollBehavior: scrollBehavior,
        useInheritedMediaQuery: useInheritedMediaQuery,
      ));
    } else {
      runApp(MaterialApp(
        key: key,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldMessengerKey,
        routes: routes,
        initialRoute: initialRoute,
        onGenerateRoute: onGenerateRoute,
        onGenerateInitialRoutes: onGenerateInitialRoutes,
        onUnknownRoute: onUnknownRoute,
        navigatorObservers: navigatorObservers,
        builder: builder,
        title: title,
        onGenerateTitle: onGenerateTitle,
        color: color,
        theme: theme,
        darkTheme: darkTheme,
        highContrastTheme: highContrastTheme,
        highContrastDarkTheme: highContrastDarkTheme,
        themeMode: themeMode,
        locale: locale,
        localizationsDelegates: localizationsDelegates,
        localeListResolutionCallback: localeListResolutionCallback,
        localeResolutionCallback: localeResolutionCallback,
        supportedLocales: supportedLocales,
        debugShowMaterialGrid: debugShowMaterialGrid,
        showPerformanceOverlay: showPerformanceOverlay,
        checkerboardRasterCacheImages: checkerboardRasterCacheImages,
        checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        showSemanticsDebugger: showSemanticsDebugger,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        shortcuts: shortcuts,
        actions: actions,
        restorationScopeId: restorationScopeId,
        scrollBehavior: scrollBehavior,
        useInheritedMediaQuery: useInheritedMediaQuery,
        home: home,
      ));
    }
  } else {
    runApp(MaterialApp(
      key: key,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: home,
      routes: routes,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
      navigatorObservers: navigatorObservers,
      builder: builder,
      title: title,
      onGenerateTitle: onGenerateTitle,
      color: color,
      theme: theme,
      darkTheme: darkTheme,
      highContrastTheme: highContrastTheme,
      highContrastDarkTheme: highContrastDarkTheme,
      themeMode: themeMode,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      debugShowMaterialGrid: debugShowMaterialGrid,
      showPerformanceOverlay: showPerformanceOverlay,
      checkerboardRasterCacheImages: checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: checkerboardOffscreenLayers,
      showSemanticsDebugger: showSemanticsDebugger,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      shortcuts: shortcuts,
      actions: actions,
      restorationScopeId: restorationScopeId,
      scrollBehavior: scrollBehavior,
      useInheritedMediaQuery: useInheritedMediaQuery,
    ));
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

void runSimulate({
  Key? key,
  GlobalKey<NavigatorState>? navigatorKey,
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  required Widget home,
  Map<String, Widget Function(BuildContext)> routes = const <String, WidgetBuilder>{},
  String? initialRoute,
  Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
  List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
  Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
  Widget Function(BuildContext, Widget?)? builder,
  String title = '',
  String Function(BuildContext)? onGenerateTitle,
  Color? color,
  ThemeData? theme,
  ThemeData? darkTheme,
  ThemeData? highContrastTheme,
  ThemeData? highContrastDarkTheme,
  ThemeMode? themeMode = ThemeMode.system,
  Locale? locale,
  Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
  Locale? Function(List<Locale>?, Iterable<Locale>)? localeListResolutionCallback,
  Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
  bool debugShowMaterialGrid = false,
  bool showPerformanceOverlay = false,
  bool checkerboardRasterCacheImages = false,
  bool checkerboardOffscreenLayers = false,
  bool showSemanticsDebugger = false,
  bool debugShowCheckedModeBanner = true,
  Map<ShortcutActivator, Intent>? shortcuts,
  Map<Type, Action<Intent>>? actions,
  String? restorationScopeId,
  ScrollBehavior? scrollBehavior,
  bool useInheritedMediaQuery = false,
  bool isShowFrame = kDebugMode,
}) async {
  scrollBehavior ??= MyScrollBehavior();
  autoSimulateApp(key: key, navigatorKey: navigatorKey, scaffoldMessengerKey: scaffoldMessengerKey, home: home, routes: routes, initialRoute: initialRoute, onGenerateRoute: onGenerateRoute, onGenerateInitialRoutes: onGenerateInitialRoutes, onUnknownRoute: onUnknownRoute, navigatorObservers: navigatorObservers, builder: builder, title: title, onGenerateTitle: onGenerateTitle, color: color, theme: theme, darkTheme: darkTheme, highContrastTheme: highContrastTheme, highContrastDarkTheme: highContrastDarkTheme, themeMode: themeMode, locale: locale, localizationsDelegates: localizationsDelegates, localeListResolutionCallback: localeListResolutionCallback, localeResolutionCallback: localeResolutionCallback, supportedLocales: supportedLocales, debugShowMaterialGrid: debugShowMaterialGrid, showPerformanceOverlay: showPerformanceOverlay, checkerboardRasterCacheImages: checkerboardRasterCacheImages, checkerboardOffscreenLayers: checkerboardOffscreenLayers, showSemanticsDebugger: showSemanticsDebugger, debugShowCheckedModeBanner: debugShowCheckedModeBanner, shortcuts: shortcuts, actions: actions, restorationScopeId: restorationScopeId, scrollBehavior: scrollBehavior, useInheritedMediaQuery: useInheritedMediaQuery, isShowFrame: isShowFrame);
}

Widget chooseWidget({
  bool isMain = true,
  required Widget main,
  required Widget second,
}) {
  if (isMain) {
    return main;
  } else {
    return second;
  }
}

class ScaffoldSimulate extends StatefulWidget {
  const ScaffoldSimulate({
    Key? key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
    this.device,
    this.isShowFrame = kDebugMode,
    this.isShowTopBar = kDebugMode,
    this.preferredSize = const Size.fromHeight(26),
    this.paddingFrame = const EdgeInsets.all(10),
  }) : super(key: key);
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final void Function(bool)? onEndDrawerChanged;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Color? drawerScrimColor;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final bool isShowFrame;
  final bool isShowTopBar;
  final DeviceInfo? device;
  final Size preferredSize;
  final EdgeInsets paddingFrame;

  @override
  State<ScaffoldSimulate> createState() => _ScaffoldSimulateState();
}

class _ScaffoldSimulateState extends State<ScaffoldSimulate> {
  late DeviceInfo device = Devices.ios.iPhone13ProMax;
  @override
  void initState() {
    super.initState();
    if (widget.device != null) {
      setState(() {
        device = widget.device!;
      });
    }
  }

  GlobalKey globalKey = GlobalKey();
  GlobalKey newglobalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double bottomBar = 150;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      bottomBar = 350;
    }
    List<Widget> topBars = [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(
              width: 10,
            ),
            Text(
              "6:09",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              CupertinoIcons.wifi,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              CupertinoIcons.battery_full,
            ),
          ],
        ),
      ),
    ];
    List<Widget> bottomBars = [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: bottomBar),
        child: Container(
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      )
    ];

    if (widget.appBar != null) {
      topBars.add(widget.appBar as Widget);
    }
    if (widget.bottomNavigationBar != null) {
      bottomBars.insert(0, widget.bottomNavigationBar as Widget);
    }
    PreferredSizeWidget? appBarLatest;

    if (widget.isShowFrame) {
      appBarLatest = PreferredSize(
        preferredSize: widget.preferredSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: (topBars is List<Widget>) ? topBars : [],
        ),
      );
    } else {
      appBarLatest = widget.appBar;
    }

    if (!widget.isShowFrame) {
      return Scaffold(
        key: widget.key,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        onDrawerChanged: widget.onDrawerChanged,
        endDrawer: widget.endDrawer,
        onEndDrawerChanged: widget.onEndDrawerChanged,
        bottomSheet: widget.bottomSheet,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        drawerScrimColor: widget.drawerScrimColor,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        restorationId: widget.restorationId,
        backgroundColor: widget.backgroundColor,
        appBar: widget.appBar,
        body: widget.body,
        bottomNavigationBar: widget.bottomNavigationBar,
      );
    }

    if (!widget.isShowTopBar) {
      appBarLatest = widget.appBar;
    }
    return RepaintBoundary(
      key: globalKey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
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
                          print(data);
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
              child: Padding(
                padding: widget.paddingFrame,
                child: Center(
                  child: DeviceFrame(
                    device: device,
                    orientation: MediaQuery.of(context).orientation,
                    screen: Scaffold(
                      floatingActionButton: widget.floatingActionButton,
                      floatingActionButtonLocation: widget.floatingActionButtonLocation,
                      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
                      persistentFooterButtons: widget.persistentFooterButtons,
                      drawer: widget.drawer,
                      onDrawerChanged: widget.onDrawerChanged,
                      endDrawer: widget.endDrawer,
                      onEndDrawerChanged: widget.onEndDrawerChanged,
                      bottomSheet: widget.bottomSheet,
                      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                      primary: widget.primary,
                      drawerDragStartBehavior: widget.drawerDragStartBehavior,
                      extendBody: widget.extendBody,
                      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
                      drawerScrimColor: widget.drawerScrimColor,
                      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
                      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
                      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
                      restorationId: widget.restorationId,
                      backgroundColor: widget.backgroundColor,
                      appBar: appBarLatest,
                      body: widget.body,
                      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: (bottomBars is List<Widget>) ? bottomBars : []),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
