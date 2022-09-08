import 'package:agro_spm_manager/contstants/constants.dart';
import 'package:agro_spm_manager/contstants/screen_size.dart';
import 'package:flutter/material.dart';

class NoBluetoothDeviceWidget extends StatelessWidget {
  const NoBluetoothDeviceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Center(
          child: Text(
            '추가 기기를 찾을 수 없어요.',
            style: makeTextStyle(18, AppColors.black, 'bold'),
          ),
        ),
        Positioned(
          bottom: 0,
          child: ElevatedButton(
            onPressed: () {},
            child: Container(
              width: size.width,
              height: 60,
              child: Center(
                  child: Text(
                '돌아가기',
                style: makeTextStyle(20, AppColors.white, 'bold'),
              )),
            ),
          ),
        )
      ],
    );
  }
}
