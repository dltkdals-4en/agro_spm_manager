
import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../gsheets/agrodoctor_api_config.dart';

class GsheetsProvider with ChangeNotifier {
  GSheets gSheets = AgrodoctorApiConfig.AgrodoctorGSheets;
  String gSheetsId = AgrodoctorApiConfig.gsheetsId;
  Spreadsheet? spreadsheet;
  Worksheet? worksheet;

  Future<void> init() async {
    spreadsheet ??= await gSheets.spreadsheet(gSheetsId);
    worksheet ??= await spreadsheet!.worksheetByTitle('test_sheet');
  }

  Future<void> insertData(String inputText, String outputText) async {
    await init();
    var startString = outputText.substring(0, 4);
    print(startString);
    switch (startString) {
      case '\$102':
        outputText = outputText.substring(5, outputText.length - 3);
        break;
      case '\$103':
        var list = outputText.split(',');
        list.removeAt(0);

        outputText = list.toString().substring(1, list.toString().length - 4);
        break;
    }

    worksheet!.values.map.insertRowByKey(DateTime.now(), {
      "입력 데이터": inputText,
      "출력 데이터": '=Split("$outputText", ",")',
    });
  }
}
