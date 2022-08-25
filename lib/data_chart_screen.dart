
import 'package:flutter/material.dart';

import 'chart_widget.dart';
import 'contstants/screen_size.dart';

class DataChartScreen extends StatelessWidget {
  const DataChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(NORMALGAP),
        child: Column(
          children: [
            Text('ㅇㅇㅇㅇ'),
            ChartWidget(),
          ],
        ),
      ),
    );
  }
}
