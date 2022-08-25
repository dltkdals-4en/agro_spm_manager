import 'package:agro_spm_manager/check_bluetooth_connected.dart';
import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:agro_spm_manager/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contstants/constants.dart';
import 'contstants/screen_size.dart';
import 'device_connect_page.dart';
import 'get_ble_devices.dart';

class PairingListPage extends StatelessWidget {
  const PairingListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bleProvider = Provider.of<BleProvider>(context);
    var settingProvider = Provider.of<SettingProvider>(context);
    var size = MediaQuery.of(context).size;
    var pairingDevices = bleProvider.pairingDevices;
    return Scaffold(
      appBar: AppBar(
        title: Text('페어링 기기 목록'),
        actions: [
          IconButton(
            onPressed: () {
              bleProvider.initPairingDevices();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.all(NORMALGAP),
                child: Text(
                  '페어링된 기기 수 : ${pairingDevices.length} 개',
                  style: makeTextStyle(18, AppColors.black, 'bold'),
                ),
              ),
              color: AppColors.white,
            ),
            SmH,
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${pairingDevices[index].name}'),
                      trailing: ElevatedButton(
                        onPressed: () {
                          settingProvider
                              .setDevice(
                                  deviceName: pairingDevices[index].name!,
                                  address: pairingDevices[index].address)
                              .then((value) {
                            bleProvider
                                .setSelectedDivice(pairingDevices[index]);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckBluetoothConnected(),
                              ),
                            );
                          });
                        },
                        child: Text('기기 연결'),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: pairingDevices.length),
            ),
            Container(
              width: size.width,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GetBleDevices(),
                      ));
                },
                child: Text('추가 기기 찾기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
