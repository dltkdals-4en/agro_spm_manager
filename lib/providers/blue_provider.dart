import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BlueProvider with ChangeNotifier {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  void startScan() {
    flutterBlue.startScan(
      timeout: Duration(seconds: 3),
    );
  }
}
