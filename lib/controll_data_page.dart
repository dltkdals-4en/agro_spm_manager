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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            bleProvider.connection?.dispose();
            bleProvider.connection = null;
            bleProvider.bleConnected = false;
            bleProvider.wavelength = false;
            bleProvider.selectedResult = '';
            Navigator.maybePop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(NORMALGAP),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bleProvider.sendData('\$preOperation()\r\n');
                      prProvider.inputProtocol('\$preOperation()\r\n');
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width / 2 - 30, 60)),
                    child: Text('램프 ON'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bleProvider.sendData('\$endOperation()\r\n');
                      prProvider.inputProtocol('\$endOperation()\r\n');
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width / 2 - 30, 60)),
                    child: Text('램프 OFF'),
                  ),
                ],
              ),
              NorH,
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
                  : Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '파장 선택: ',
                              style: makeTextStyle(18, AppColors.black, 'bold'),
                            ),
                            SmW,
                            DropdownButton(
                              value: bleProvider.selectedWave,
                              items: bleProvider.waveList.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Text('$e'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                bleProvider.changeWave(value);

                              },
                            ),
                          ],
                        ),
                        NorH,
                        Row(
                          children: [
                            Text(
                              '해당 파장 값: ',
                              style: makeTextStyle(18, AppColors.black, 'bold'),
                            ),
                            Text(
                              '${bleProvider.selectedResult}',
                              style: makeTextStyle(
                                  18, AppColors.lightPrimary, 'bold'),
                            )
                          ],
                        ),
                      ],
                    ),
              NorH,
              ElevatedButton(
                onPressed: () {
                  bleProvider.sendData('\$getSpectrumData()\r\n');
                  prProvider.inputProtocol('\$getSpectrumSensor()\r\n');
                },
                style:
                    ElevatedButton.styleFrom(fixedSize: Size(size.width, 60)),
                child: Text('센서 측정하기'),
              ),
              NorH,
              ElevatedButton(
                onPressed: () {
                  gsheets.insertData(bleProvider.selectedWave, bleProvider.selectedResult, bleProvider.result).then((value) {
                    makeFToast(context, size, '저장되었습니다.');
                  });
                },
                style:
                    ElevatedButton.styleFrom(fixedSize: Size(size.width, 60)),
                child: Text('결과값 스프레드시트 저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
