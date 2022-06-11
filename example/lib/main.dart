// ignore_for_file: dead_code, non_constant_identifier_names

import 'package:simulate/simulate.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  autoSimulateApp(
    debugShowCheckedModeBanner: false,
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
    return scaffoldSimulate(
      device: Devices.android.samsungGalaxyNote20Ultra,
      body: Center(
        child: Text(
          "hello $count",
          style: const TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "azka",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignPage();
              }));
            },
            child: const Icon(Iconsax.backward),
          ),
          const SizedBox(width: 20,),
          FloatingActionButton(
            heroTag: "baru",
            onPressed: () {
              setState(() {
                count++;
              });

            },
            child: const Icon(Iconsax.add_circle),
          ),
        ],
      ),
    );
  }
}

class SignPage extends StatefulWidget {
  SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    return scaffoldSimulate(
      body: const Center(
        child: Text(
          "Sign Page",
          style: TextStyle(color: Colors.black, fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "baru azka",
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const MyPage();
          }));
        },
        child: const Icon(Iconsax.backward),
      ),
    );
  }
}
