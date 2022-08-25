import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              axisNameSize: 20,
              sideTitles: SideTitles(
                interval: 10,
                showTitles: true,
                reservedSize: 30,
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 20,
              sideTitles: SideTitles(
                interval: 5,
                showTitles: true,
                reservedSize: 30,
              ),
            ),
          ),
          borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1)),
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 6,
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 3),
                FlSpot(2.6, 2),
                FlSpot(4.9, 5),
                FlSpot(6.8, 3.1),
                FlSpot(8, 4),
                FlSpot(9.5, 3),
                FlSpot(11, 4),
              ],
              isCurved: true,
              barWidth: 5,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
              ),
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
