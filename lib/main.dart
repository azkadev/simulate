// ignore_for_file: avoid_print

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:iconsax/iconsax.dart';

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.setEffect(
    effect: WindowEffect.transparent,
  );
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showPerformanceOverlay: false,
      home: WindowBorder(
        color: Colors.blue,
        width: 1,
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
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
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "ios 14.4",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 105, 104, 104),
                                      fontWeight: FontWeight.w500),
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
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: DeviceFrame(
                        device: Devices.ios.iPhone13ProMax,
                        isFrameVisible: true,
                        orientation: MediaQuery.of(context).orientation,
                        screen: const MyHomePage(title: "title"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ),
  );

  doWhenWindowReady(() {
    const initialSize = const Size(450, 1020);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
    return Scaffold(
      body: Stack(
        children: [
          Scaffold(
            body: Center(
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

          // botom
          Positioned(
            bottom: 10,
            right: bottomBar,
            left: bottomBar,
            child: Container(
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
