import 'package:agro_spm_manager/auto_connecting_page.dart';
import 'package:agro_spm_manager/contstants/loading_page.dart';
import 'package:agro_spm_manager/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ble_connect/get_pairing_devices.dart';

class FindSavedDevice extends StatelessWidget {
  const FindSavedDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pref = Provider.of<SettingProvider>(context);
    switch (pref.checkSaved) {
      case 0:
        pref.checkIsSaved();
        return LoadingPage('저장된 기기를 찾는 중이에요..');
      case 1:
        return GetPairingDevices();
      case 2:
        return AutoConnectingPage();
      default:
        return LoadingPage('');
    }
    // if (pref.isSaved ==false) {
    //   pref.checkIsSaved().then((value) {
    //     return GetPairingDevices();
    //   });
    //   return LoadingPage('저장된 기기를 찾는 중이에요..');
    // } else {
    //   return AutoConnectingPage();
    // }
  }
}
