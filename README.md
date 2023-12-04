# simulate 

Simulate your project flutter on cross platform with frame device ( android , ios, desktop ) on your os without heavy vm

## Demo 

![Screenshot from 2022-06-13 06-29-30](https://user-images.githubusercontent.com/82513502/173258012-cc84255e-4b09-4db6-b988-30a10c3be1fd.png)



https://user-images.githubusercontent.com/82513502/173173590-9b3a4d3e-484b-4508-baf8-9bd8cb49b35f.mp4

```bash
flutter pub add simulate
```
```dart
// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:simulate/simulate.dart';

void main() async {
  await initSimulate(
    
  );
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
        isShowFrame: true, // set false for disabled
        isShowTopFrame: true,
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
```

 