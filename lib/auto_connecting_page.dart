import 'package:agro_spm_manager/check_bluetooth_connected.dart';
import 'package:agro_spm_manager/controll_data_page.dart';
import 'package:agro_spm_manager/contstants/loading_page.dart';
import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AutoConnectingPage extends StatelessWidget {
  const AutoConnectingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var bleProvider = Provider.of<BleProvider>(context);
    if (!bleProvider.findPairingDevices) {
      bleProvider.getPairingList();
      return LoadingPage('');
    } else {
      if (!bleProvider.isSaved) {
        bleProvider.compareSaved();
        return LoadingPage('');
      } else {
        return CheckBluetoothConnected();
      }
    }
  }
}
