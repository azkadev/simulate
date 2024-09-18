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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';
import 'package:simulate/simulate.dart';

void main() async {
  await Simulate.ensureInitialized(
    isSimulate: true,
  );

  runApp(
    const App(),
  );
}

GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // auto change theme dark mode and white mode / light mode
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          home: () {
            if (Platform.isAndroid || Platform.isIOS ) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: context.height,
                  minWidth: context.width
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: context.mediaQueryData.padding.top,
                    ),
                    Flexible(
                      child: Simulate(
                        generalLibFlutterApp: generalLibFlutterApp,
                        isShowExperimental: true,
                        isShowFrame: true,
                        isShowTopFrame: true,
                        // isShowFrame: true, // set false for disabled
                        // isShowTopFrame: true,
                        // isShowExperimental: true,
                        home: MaterialApp(
                          theme: lightTheme,
                          darkTheme: darkTheme,
                          themeMode: themeMode,
                          debugShowCheckedModeBanner: false,
                          debugShowMaterialGrid: false,
                          showPerformanceOverlay: false,
                          home: const Home(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SimulateApp(
              generalLibFlutterApp: generalLibFlutterApp,
              // isShowFrame: true, // set false for disabled
              // isShowTopFrame: true,
              // isShowExperimental: true,
              home: (context) {
                return MaterialApp(
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  themeMode: themeMode,
                  debugShowCheckedModeBanner: false,
                  debugShowMaterialGrid: false,
                  showPerformanceOverlay: false,
                  home: const Home(),
                );
              },
            );
          }(),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Gello"),
      ),
      body: const Center(
        child: Text("Alow"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const LoginScreen();
            }),
          );
        },
        child: const Icon(
          Icons.login,
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: const Center(
        child: Text("Alow"),
      ),
    );
  }
}
