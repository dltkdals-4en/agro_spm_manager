import 'package:agro_spm_manager/controll_data_page.dart';
import 'package:agro_spm_manager/contstants/loading_page.dart';
import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckBluetoothConnected extends StatelessWidget {
  const CheckBluetoothConnected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleProvider = Provider.of<BleProvider>(context);
    var size = MediaQuery.of(context).size;
    if (bleProvider.bleConnected) {
      if (!bleProvider.wavelength) {
        bleProvider.getWavelength();
        return LoadingPage('데이터 가져오는중..');
      } else {
        return ControllDataPage();
      }
    } else {
      print(bleProvider.selectDevice?.name);
      bleProvider.connectBle(context, size);
      return LoadingPage('기기 연결 중이에요.');
    }
  }
}
