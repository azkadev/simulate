import 'package:general_lib/general_lib.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) {
  Dart.pub
      .installFromDirectory(directoryPackage: Directory.current)
      .printPretty();
}
