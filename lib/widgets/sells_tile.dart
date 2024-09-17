import 'package:baia_ui/widgets/line_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SellsTile extends StatelessWidget {
  final List<FlSpot> spots;
  const SellsTile({super.key, required this.spots});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/ventasBg.png'),
                              opacity: 0.1,
                              scale: .1,
                              repeat: ImageRepeat.repeat),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 246, 94, 65),
                            Color.fromARGB(255, 47, 82, 224)
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: MyLineChart(
                          maxHeight: 5,
                          maxXSum: 5, spots: spots),
                      ),
                    ),
                  );
  }
}