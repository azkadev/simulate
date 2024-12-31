import 'package:general_lib/general_lib.dart';
import 'package:io_universe/io_universe.dart';

void main(List<String> args) {
  Dart.pub.installFromDirectoryFresh(directoryPackage: Directory.current).printPretty();
}
