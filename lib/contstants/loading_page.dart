
import 'package:flutter/material.dart';

import 'constants.dart';
import 'loading_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage(this.loadingText, {Key? key}) : super(key: key);

  final String loadingText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingWidget(),
          SmH,
          Text(
            '$loadingText',
            style: makeTextStyle(16, AppColors.black, 'regular'),
          ),
        ],
      ),
    );
  }
}
