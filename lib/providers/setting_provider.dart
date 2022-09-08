import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingProvider with ChangeNotifier {
  String existingDevice = '';
  bool isSaved = false;
  bool debugVisibility = false;
  int checkSaved = 0;

  Future<void> setDevice(
      {required String deviceName, required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('device') != deviceName) {
      await prefs.setString('device', deviceName);
      await prefs.setString('address', address);
      existingDevice = (await prefs.getString('device'))!;
    }
    notifyListeners();
  }

  Future<void> checkIsSaved() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('device') == null) {
      checkSaved = 1;
      notifyListeners();
    } else {
      checkSaved = 2;
      notifyListeners();
    }
  }
}
