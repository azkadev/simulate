import 'package:simulate/simulate.dart';
import 'package:flutter/material.dart';

void main() {
  simulateApp(
    home: const MyPage(),
  );
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
      body:  Center(
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
