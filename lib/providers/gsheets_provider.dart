
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

  Future<void> insertData(String seletedWave, String selectedResult,String result) async {
    await init();
   

    worksheet!.values.map.insertRowByKey(DateTime.now(), {
      "입력 파장": seletedWave,
      "파장 데이터" : selectedResult,
      "전체 데이터": '=Split("$result", ",")',
    });
  }
}
