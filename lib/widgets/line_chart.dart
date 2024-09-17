import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatelessWidget {
  final List<FlSpot> spots;
  final List<Color> gradientColors = [
    const Color.fromARGB(255, 213, 213, 213),
    Colors.white,
  ];
  final bool showTitles;
  final double minX;
  final double maxXSum;
  final double maxHeight;
  final double minHeight;

  MyLineChart(
      {super.key,
      required this.spots,
      this.maxHeight = 130,
      this.showTitles = true,
      this.minX = 0,
      this.maxXSum = 0,
      this.minHeight = 0});

  Color getTooltipColor(LineBarSpot touchedSpot) {
    return const Color.fromARGB(255, 0, 160, 240);
  }

  List<LineTooltipItem> getMyLineTooltipItem(List<LineBarSpot> touchedSpots) {
  return touchedSpots.map((LineBarSpot touchedSpot) {
    final textStyle = TextStyle(
      color: touchedSpot.bar.gradient?.colors.first ??
          touchedSpot.bar.color ??
          const Color.fromARGB(255, 139, 96, 105),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return LineTooltipItem(touchedSpot.y.toString(), textStyle);
  }).toList();
}

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
            lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
              getTooltipColor: getTooltipColor,
              getTooltipItems: getMyLineTooltipItem
            )),
            minX: minX,
            maxX: spots.length.toDouble() - 1,
            maxY: maxHeight,
            minY: minHeight,
            borderData: FlBorderData(
                show: false,
                border:
                    Border.all(color: Theme.of(context).colorScheme.secondary)),
            titlesData: FlTitlesData(
              show: showTitles,
              leftTitles: const AxisTitles(
                  sideTitles: SideTitles(reservedSize: 44, showTitles: false)),
              topTitles: const AxisTitles(
                  sideTitles: SideTitles(reservedSize: 30, showTitles: false)),
              rightTitles: const AxisTitles(
                  sideTitles: SideTitles(reservedSize: 44, showTitles: false)),
              bottomTitles: const AxisTitles(
                  sideTitles: SideTitles(reservedSize: 30, showTitles: false)),
            ),
            gridData: FlGridData(
              show: false,
              getDrawingVerticalLine: (value) {
                return FlLine(
                    color: Theme.of(context).colorScheme.secondary,
                    strokeWidth: 1);
              },
              getDrawingHorizontalLine: (value) {
                return FlLine(
                    color: Theme.of(context).colorScheme.secondary,
                    strokeWidth: 1);
              },
            ),
            lineBarsData: [
              LineChartBarData(
                  dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                              radius: 4,
                              color: Color.fromARGB(124, 59, 47, 224),
                              strokeWidth: 1,
                              strokeColor: Color.fromARGB(57, 255, 255, 255))),
                  spots: spots,
                  isCurved: true,
                  barWidth: 8,
                  belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.3))
                              .toList())),
                  gradient: LinearGradient(
                      colors:
                          gradientColors) //Theme.of(context).colorScheme.inversePrimary
                  )
            ]),
      );
}
