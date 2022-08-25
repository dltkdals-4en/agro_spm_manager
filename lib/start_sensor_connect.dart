import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_chart_screen.dart';

class StartSensorConnect extends StatelessWidget {
  const StartSensorConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleProvider = Provider.of<BleProvider>(context);
    if (!bleProvider.wavelength) {
      bleProvider.getWavelength();
      return Container();
    } else {
      return DataChartScreen();
    }
  }
}
