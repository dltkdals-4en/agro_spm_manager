import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contstants/loading_page.dart';
import 'ble_scanning_page.dart';



class GetBleDevices extends StatelessWidget {
  const GetBleDevices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleProvider = Provider.of<BleProvider>(context);
    if (!bleProvider.findBleDevices) {
      bleProvider.scanBle();
      return LoadingPage('블루투스 스캔 중이에요...');
    } else {
      return BleScanningPage();
    }
  }
}
