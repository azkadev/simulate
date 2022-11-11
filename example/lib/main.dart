// ignore_for_file: unused_local_variable, duplicate_ignore

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:simulate/simulate.dart';

void main() {
  runAppSimulate(
    App(),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Simulate(
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Alow"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,

            // PageRouteBuilder(
            //   pageBuilder: (context, animation1, animation2) {
            //     return LoginScreen();
            //   },
            //   transitionDuration: Duration.zero,
            //   reverseTransitionDuration: Duration.zero,
            // ),
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        },
        child: Icon(
          Icons.login,
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

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
          child: Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Center(
        child: Text("Alow"),
      ),
    );
  }
}
