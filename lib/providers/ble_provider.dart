import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../contstants/constants.dart';

class BleProvider with ChangeNotifier {
  FlutterBluetoothSerial serial = FlutterBluetoothSerial.instance;
  List<BluetoothDevice> pairingDevices = [];
  List<BluetoothDiscoveryResult> bleDevices =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  BluetoothDevice? selectDevice;
  bool findPairingDevices = false;
  bool findBleDevices = false;
  BluetoothConnection? connection;
  bool bleConnected = false;
  int? selectedIndex;
  List<String> outputList = [];
  String outputText = "출력값이 없습니다.";
  bool wavelength = false;
  List<int> waveList = [];
  List<int> test = [];

  void scanBle() {
    serial.startDiscovery().listen((event) {
      final existingIndex = bleDevices.indexWhere(
          (element) => element.device.address == event.device.address);
      if (existingIndex >= 0) {
        bleDevices[existingIndex] = event;
      } else {
        var deviceName =
            (event.device.name != null) ? event.device.name : '알 수 없는 기기';

        if (deviceName!.contains('AgroSPM')) {
          bleDevices.add(event);
        }
      }
    }).onDone(() {
      findBleDevices = true;
      print('END $findBleDevices');
      notifyListeners();
    });
  }

  Future<void> connecteBle(BuildContext context, Size size) async {
    print('connectBle() : ${selectDevice!.isConnected}');
    if (!bleConnected) {
      await BluetoothConnection.toAddress(selectDevice!.address).then((value) {
        connection = value;
        bleConnected = value.isConnected;

        notifyListeners();
        connection!.input!.listen((event) {
          test += event;
          // _onDataReceived(event);
          // notifyListeners();
        }).onData((data) {
          print('11 $data');
        });
      }).catchError((e) {
        makeFToast(context, size, "기기 연결을 확인해주세요");
      });
    } else {
      bleConnected = false;
      if (connection != null) {
        connection!.dispose();

        connection = null;
      }
      print('con');
      notifyListeners();
    }
  }

  String existingDevice = '';

  Future<void> setDevice(context, size,
      {required String deviceName, required String address}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('device') != deviceName) {
      await prefs.setString('device', deviceName);
      await prefs.setString('address', address);
      existingDevice = (await prefs.getString('device'))!;
      notifyListeners();
    } else {}
  }

  Future<void> sendData(String str) async {
    outputList.clear();
    String sendStr = '$str\r\n';

    var i = Uint8List.fromList(utf8.encode(sendStr));

    if (str.length > 0) {
      try {
        connection!.output.add(i);
        await connection!.output.allSent;
      } catch (e) {
        print(e);
        // Ignore error, but notify state

      }
    }
  }

  String _onDataReceived(Uint8List data) {
    // Allocate buffer for parsed data
    print(data);
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    // Apply backspace control character
    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    // Create message if there is new line character

    String dataString = String.fromCharCodes(buffer);
    String dataString2 = String.fromCharCodes(data);

    outputProtocol(dataString);

    return dataString;
    int index = buffer.indexOf(13);
  }

  int outputDataLength = 0;

  void outputProtocol(String str) {
    outputList.add(str);

    setOutPutData();
  }

  void setOutPutData() {
    outputText = '';

    outputList.forEach((element) {
      outputText += element;
    });

    notifyListeners();
  }

  String getOutputData() {
    String data = '';
    outputList.forEach((element) {
      data += element;
    });

    outputDataLength = data.split(',').length;

    return data;
  }

  Future<void> getPairingList() async {
    await serial.getBondedDevices().then((List<BluetoothDevice> bondedDevices) {
      pairingDevices = bondedDevices
          .where((element) => element.name!.contains('AgroSPM'))
          .toList();
    }).then((value) {
      findPairingDevices = true;
      notifyListeners();
    });
  }

  void initPairingDevices() {
    pairingDevices.clear();
    notifyListeners();
    getPairingList();
  }

  void initBleDevices() {
    bleDevices.clear();
    notifyListeners();
    scanBle();
  }

  Future<void> devicePairing(String address) async {
    await serial.bondDeviceAtAddress(address);
    notifyListeners();
  }

  void setSelectedDivice(BluetoothDevice device) {
    selectDevice = device;
    notifyListeners();
  }

  void getWavelength() {
    sendData('connectSensor\r\n').then((value) {
      Future.delayed(Duration(milliseconds: 333), () {
        wavelength = true;
        notifyListeners();
      });
    });
  }
}
