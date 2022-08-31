import 'package:agro_spm_manager/contstants/constants.dart';
import 'package:flutter/material.dart';

class NoBluetoothDeviceWidget extends StatelessWidget {
  const NoBluetoothDeviceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '추가 기기를 찾을 수 없어요.',
          style: makeTextStyle(18, AppColors.black, 'bold'),
        ),
        ElevatedButton(
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
        )
      ],
    );
  }
}
