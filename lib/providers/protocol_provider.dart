import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../contstants/constants.dart';

class ProtocolProvider with ChangeNotifier {
  TextEditingController anyProtocol = TextEditingController();
  String bleConnected = "연결 안됨";
  String inputText = "입력값이 없습니다.";
  TextStyle? bleConnectedStyle;

  void setBleConnectedText(bool connected) {
    if (connected) {
      bleConnected = "연결됨";
      bleConnectedStyle = makeTextStyle(18, AppColors.lightPrimary, 'bold');
    } else {
      bleConnected = "연결안됨";
      bleConnectedStyle = makeTextStyle(18, AppColors.black, 'bold');
    }
  }

  void inputProtocol(String str) {
    var i = Uint8List.fromList(utf8.encode(str));

    if (i[i.length - 2] == 13 && i[i.length - 1] == 10) {
      inputText = '${str.substring(0, str.length - 2)}\\r\\n';

      notifyListeners();
    } else {
      inputText = str;

      notifyListeners();
    }
  }

  String outputText = "출력값이 없습니다.";

  void outputProtocol(String str) {
    var i = Uint8List.fromList(utf8.encode(str));

    if (i[i.length - 2] == 13 && i[i.length - 1] == 10) {
      outputText = '${str.substring(0, str.length - 2)}\\r\\n';

      notifyListeners();
    } else {
      outputText = str;

      notifyListeners();
    }
  }
}
