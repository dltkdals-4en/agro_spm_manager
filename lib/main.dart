import 'package:agro_spm_manager/providers/ble_provider.dart';
import 'package:agro_spm_manager/providers/chart_data_provider.dart';
import 'package:agro_spm_manager/providers/gsheets_provider.dart';
import 'package:agro_spm_manager/providers/protocol_provider.dart';
import 'package:agro_spm_manager/providers/setting_provider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'contstants/constants.dart';
import 'contstants/screen_size.dart';
import 'get_pairing_devices.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<BleProvider>(
          create: (_) => BleProvider(),
        ),
        ChangeNotifierProvider<ProtocolProvider>(
          create: (_) => ProtocolProvider(),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (_) => SettingProvider(),
        ),
        ChangeNotifierProvider<GsheetsProvider>(
          create: (_) => GsheetsProvider(),
        ),
        ChangeNotifierProvider<ChartDataProvider>(
          create: (_) => ChartDataProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('my App');
    return ScreenUtilInit(
        designSize: const Size(805.3, 384.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            color: Colors.lightBlue,
            home: GetPairingDevices(),
            theme: ThemeData(
              fontFamily: 'NotoSansKR',
              textTheme: TextTheme(
                headline6: makeTextStyle(20, AppColors.black, 'bold'),
                subtitle1: makeTextStyle(16, AppColors.black, 'bold'),
              ),
              appBarTheme: AppBarTheme(
                  centerTitle: true,
                  toolbarTextStyle: makeTextStyle(20, AppColors.black, 'bold'),
                  color: AppColors.white,
                  titleTextStyle: makeTextStyle(20, AppColors.black, 'bold'),
                  iconTheme: IconThemeData(
                    color: AppColors.black,
                  ),
                  elevation: 0),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.lightPrimary,
                  textStyle: makeTextStyle(16, AppColors.white, 'bold'),
                ),
              ),
              listTileTheme: ListTileThemeData(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: NORMALGAP, vertical: SMALLGAP),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SMALLGAP),
                ),
                tileColor: AppColors.white,
                textColor: AppColors.black,
              ),
            ),
          );
        });
  }
}
