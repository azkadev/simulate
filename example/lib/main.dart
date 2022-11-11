// ignore_for_file: dead_code, non_constant_identifier_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:simulate/simulate.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;
import 'package:hexaminate/hexaminate.dart';
import 'package:easy_isolate/easy_isolate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EventEmitter emitter = EventEmitter();
  Worker worker = Worker();

  int _received = 0;
  int _total = 0;
  File? _image;
  final List<int> _bytes = [];
  late bool is_done = false;
  var getPath = await getApplicationDocumentsDirectory();
  var paths = getPath.path;
  String path = paths;
  worker.init((data, isolateSendPort) async {
    if (data is List<int>) {
      _bytes.addAll(data);
      _received += data.length;
      emitter.emit("update", null, {"@type": "update", "bytes": _bytes, "received": _received, "total": _total});
    } else if (data is File) {
      _image = data;
    } else if (data is String) {
      isolateSendPort.send("oke");
    } else if (data is int) {
      _total = data;
      emitter.emit("update", null, {"@type": "update", "total": _total, "bytes": _bytes, "received": _received});
    } else if (data is bool) {
      var file = File('$path/image.png');
      await file.writeAsBytes(_bytes);
      emitter.emit("update", null, {"@type": "done", "path": "$path/image.png"});
      _total = 0;
      _received = 0;
      _bytes.clear();
    }
  }, (data, mainSendPort, onSendError) async {
    late http.StreamedResponse _response;
    _response = await http.Client().send(http.Request('GET', Uri.parse('https://upload.wikimedia.org/wikipedia/commons/f/ff/Pizigani_1367_Chart_10MB.jpg')));
    int total = _response.contentLength ?? 0;

    mainSendPort.send(total);
    _response.stream.listen((value) async {
      await Future.delayed(const Duration(microseconds: 1));
      mainSendPort.send(value);
    }).onDone(() async {
      mainSendPort.send(true);
    });
  });
  emitter.on("update", null, (Event ev, context) {
    if (ev.eventData is Map) {
      var update = ev.eventData as Map;
      if (update["@type"] is String) {
        var type = update["@type"];
        if (type == "start") {
          worker.sendMessage("message");
        }
      }
    }
  });

  // autoSimulateApp(
  //   debugShowCheckedModeBanner: false,
  //   home: MyPage(
  //     emitter: emitter,
  //   ),
  // );
  runSimulate(home: MyPage(emitter: emitter), debugShowCheckedModeBanner: false);
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.emitter}) : super(key: key);
  final EventEmitter emitter;
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return ScaffoldSimulate(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width, minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "hello $count",
                style: const TextStyle(color: Colors.black, fontSize: 50),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "azka",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignPage(
                  emitter: widget.emitter,
                );
              }));
            },
            child: const Icon(Iconsax.backward),
          ),
          const SizedBox(
            width: 20,
          ),
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
  const SignPage({Key? key, required this.emitter}) : super(key: key);
  final EventEmitter emitter;
  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  int _received = 0;
  late EventEmitter emitter;
  int _total = 0;
  File? _image;
  late List<int> _bytes = [];
  GlobalKey globalKey = GlobalKey();

  late bool is_done = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      emitter = widget.emitter;
    });

    emitter.on("update", null, (Event ev, context) {
      if (ev.eventData is Map) {
        var update = ev.eventData as Map;
        if (update["@type"] is String) {
          var type = update["@type"];
          if (type == "update") {
            setState(() {
              _received = update["received"];
              _total = update["total"];
              _bytes = update["bytes"];
            });
          }
          if (type == "done") {
            _image = File(update["path"]);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Sas");
    return ScaffoldSimulate(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SizedBox.fromSize(
            size: const Size(400, 300),
            child: _image == null ? const Placeholder() : Image.file(_image!, fit: BoxFit.fill),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "azka",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyPage(
                  emitter: widget.emitter,
                );
              }));
            },
            child: const Icon(Iconsax.backward),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton.extended(
            label: Text('${_received ~/ 1024}/${_total ~/ 1024} KB'),
            icon: const Icon(Iconsax.document_download),
            onPressed: () {
              emitter.emit("update", null, {"@type": "start"});
            },
          )
        ],
      ),
    );
  }
}
