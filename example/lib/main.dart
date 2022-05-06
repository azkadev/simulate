// ignore_for_file: dead_code, non_constant_identifier_names

import 'package:simulate/simulate.dart';
import 'package:flutter/material.dart';

void main() {
  bool is_run_simulate = true;
  if (is_run_simulate) {
    simulateApp(
      home: const MyPage(),
    );
  } else {
    runApp(
      MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        showPerformanceOverlay: false,
        home: const MyPage(),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "hello $count",
          style: const TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
