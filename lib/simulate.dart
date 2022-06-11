// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/foundation.dart';

export 'package:device_frame/device_frame.dart';
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
  }
}

Widget scaffoldSimulate({Key? key, PreferredSizeWidget? appBar, required Widget body, Widget? floatingActionButton, FloatingActionButtonLocation? floatingActionButtonLocation, FloatingActionButtonAnimator? floatingActionButtonAnimator, List<Widget>? persistentFooterButtons, Widget? drawer, void Function(bool)? onDrawerChanged, Widget? endDrawer, void Function(bool)? onEndDrawerChanged, Widget? bottomNavigationBar, Widget? bottomSheet, Color? backgroundColor, bool? resizeToAvoidBottomInset, bool primary = true, DragStartBehavior drawerDragStartBehavior = DragStartBehavior.start, bool extendBody = false, bool extendBodyBehindAppBar = false, Color? drawerScrimColor, double? drawerEdgeDragWidth, bool drawerEnableOpenDragGesture = true, bool endDrawerEnableOpenDragGesture = true, String? restorationId, bool isShowFrame = kDebugMode, DeviceInfo? device}) {
  return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
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
      SizedBox(
        height: 5,
      )
    ];

    if (appBar != null) {
      topBars.insert(0, appBar);
    }
    if (bottomNavigationBar != null) {
      bottomBars.insert(0, bottomNavigationBar);
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: chooseWidget(
        isMain: isShowFrame,
        main: Column(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "iPhone 13 Pro Max",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "ios 14.4",
                            style: TextStyle(color: Color.fromARGB(255, 105, 104, 104), fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      const Spacer(),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Center(
                child: DeviceFrame(
                  device: device ?? Devices.ios.iPhone13ProMax,
                  isFrameVisible: true,
                  orientation: MediaQuery.of(context).orientation,
                  screen: Scaffold(
                    key: key,
                    floatingActionButton: floatingActionButton,
                    floatingActionButtonLocation: floatingActionButtonLocation,
                    floatingActionButtonAnimator: floatingActionButtonAnimator,
                    persistentFooterButtons: persistentFooterButtons,
                    drawer: drawer,
                    onDrawerChanged: onDrawerChanged,
                    endDrawer: endDrawer,
                    onEndDrawerChanged: onEndDrawerChanged,
                    bottomSheet: bottomSheet,
                    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                    primary: primary,
                    drawerDragStartBehavior: drawerDragStartBehavior,
                    extendBody: extendBody,
                    extendBodyBehindAppBar: extendBodyBehindAppBar,
                    drawerScrimColor: drawerScrimColor,
                    drawerEdgeDragWidth: drawerEdgeDragWidth,
                    drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                    endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
                    restorationId: restorationId,
                    backgroundColor: backgroundColor,
                    appBar: appBar,
                    body: Stack(
                      children: [
                        body,
                        // status_bar
                        Positioned(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: topBars,
                          ),
                        ),
                      ],
                    ),
                    bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: bottomBars),
                  ),
                ),
              ),
            ),
          ],
        ),
        second: body,
      ),
    );
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, this.home, this.bottomNavigationBar}) : super(key: key);

  final String title;
  final Widget? home;
  final Widget? bottomNavigationBar;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double bottomBar = 150;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      bottomBar = 350;
    }
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
      SizedBox(
        height: 5,
      )
    ];

    if (widget.bottomNavigationBar != null) {
      bottomBars.insert(0, widget.bottomNavigationBar!);
    }
    return Scaffold(
      body: Stack(
        children: [
          widget.home ??
              Scaffold(
                body: const Center(
                  child: Text("Hello world"),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Iconsax.play),
                ),
              ),

          // status_bar
          Positioned(
            child: Container(
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
          ),
        ],
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: bottomBars),
    );
  }
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
