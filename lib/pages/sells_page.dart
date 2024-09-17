import 'package:baia_ui/constants.dart';
import 'package:baia_ui/widgets/sells_tile.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SellsPage extends StatelessWidget {
  const SellsPage({super.key});

  
  @override
  Widget build(BuildContext context) {

  const List<FlSpot> todaySpots = [
    FlSpot(0, 1),
    FlSpot(1, 1.5),
    FlSpot(2, 1.4),
    FlSpot(3, 3.4),
    FlSpot(4, 2),
    FlSpot(5, 2.2),
    FlSpot(6, 1.8),
    FlSpot(7, 2.8),
    FlSpot(8, 2.5),
    FlSpot(9, 2.2),
    FlSpot(10, 2.8),
  ];
  const List<FlSpot> weekSpots = [
    FlSpot(0, 2.8),
    FlSpot(1, 2.3),
    FlSpot(2, 1.7),
    FlSpot(3, 3.1),
    FlSpot(4, 1.9),
    FlSpot(5, 3.0),
    FlSpot(6, 2.4),
    FlSpot(7, 3.2),
    FlSpot(8, 3.8),
    FlSpot(9, 4.2),
    FlSpot(10, 3.7),
  ];

  const List<FlSpot> monthSpots = [
    FlSpot(0, 2),
    FlSpot(1, 2.5),
    FlSpot(2, 3),
    FlSpot(3, 2.8),
    FlSpot(4, 3.5),
    FlSpot(5, 3.2),
    FlSpot(6, 3.8),
    FlSpot(7, 3.6),
    FlSpot(8, 4),
    FlSpot(9, 3.7),
    FlSpot(10, 4.2),
  ];

  List<String> tabsStringList = ["Hoy", "Esta semana", "Este mes"];
  
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        
        body: Column(
          children: [
            TabBar(
              tabs: tabsStringList
                  .map((tab) => Tab(
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 4),
                          height: 20,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromARGB(96, 158, 158, 158)),
                          child: Text(
                            tab,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ))
                  .toList(),
            ),
             Container(
              height: 250,
              child: const TabBarView(
                children: [
                  SellsTile(
                    spots: todaySpots,
                  ),
                  SellsTile(
                    spots: weekSpots,
                  ),
                  SellsTile(
                    spots: monthSpots,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Desglose', style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: desgloseSellsJson.map((item) =>  Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                      Text("#${item['id']}"),
                      Text("${item['date'].toString()} ${item['time'].toString()}")
                    ],),
                    Text("${r'$'}${item['amount']}", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
              )).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
