import 'package:agro_spm_manager/contstants/constants.dart';
import 'package:agro_spm_manager/contstants/debug_mode.dart';
import 'package:agro_spm_manager/contstants/screen_size.dart';
import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:agro_spm_manager/providers/gsheets_provider.dart';
import 'package:agro_spm_manager/providers/protocol_provider.dart';
import 'package:agro_spm_manager/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:provider/provider.dart';

class ControllDataPage extends StatelessWidget {
  const ControllDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleProvider = Provider.of<BleProvider>(context);
    var gsheets = Provider.of<GsheetsProvider>(context);
    var prProvider = Provider.of<ProtocolProvider>(context);
    var settingProvider = Provider.of<SettingProvider>(context);
    var size = MediaQuery.of(context).size;
    BluetoothDevice device = bleProvider.selectDevice!;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NORMALGAP),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (controllDataPageDebug)
                  ? Column(
                      children: [
                        Text(
                          '결과 표시창',
                          style: makeTextStyle(18, AppColors.black, 'bold'),
                        ),
                        SmH,
                        Container(
                          width: size.width,
                          height: size.height / 3,
                          color: Colors.amber,
                        ),
                      ],
                    )
                  : DropdownButton(
                      items: bleProvider.waveList.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text('$e'),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
              NorH,
              ElevatedButton(
                onPressed: () {
                  bleProvider.sendData('\$preOperation()\r\n');
                  prProvider.inputProtocol('\$preOperation()\r\n');
                },
                style:
                    ElevatedButton.styleFrom(fixedSize: Size(size.width, 60)),
                child: Text('전구 켜기'),
              ),
              ElevatedButton(
                onPressed: () {
                  bleProvider.sendData('\$preOperation()\r\n');
                  prProvider.inputProtocol('\$preOperation()\r\n');
                },
                child: Text('preOperation'),
              ),
              ElevatedButton(
                onPressed: () {
                  bleProvider.sendData('\$preOperation()\r\n');
                  prProvider.inputProtocol('\$preOperation()\r\n');
                },
                child: Text('preOperation'),
              ),
              ElevatedButton(
                onPressed: () {
                  bleProvider.sendData('\$preOperation()\r\n');
                  prProvider.inputProtocol('\$preOperation()\r\n');
                },
                child: Text('preOperation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
