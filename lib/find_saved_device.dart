import 'package:agro_spm_manager/auto_connecting_page.dart';
import 'package:agro_spm_manager/contstants/loading_page.dart';
import 'package:agro_spm_manager/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FindSavedDevice extends StatelessWidget {
  const FindSavedDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pref = Provider.of<SettingProvider>(context);
    if (!pref.isSaved) {
      pref.checkIsSaved();
      print('no');
      return LoadingPage('저장된 기기 찾는 중..');
    } else {
      print('autoConnect');
      return AutoConnectingPage();
    }
  }
}
