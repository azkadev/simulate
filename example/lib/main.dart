// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:simulate/simulate.dart';

void main() {
  initSimulate();
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Simulate(
        home: MaterialApp(
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          showPerformanceOverlay: false,
          home: Home(),
        ),
      ),
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
      body: const Center(
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
  const LoginScreen({Key? key}) : super(key: key);

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
