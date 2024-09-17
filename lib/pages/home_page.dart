import 'package:baia_ui/constants.dart';
import 'package:baia_ui/widgets/latest_orders.dart';
import 'package:baia_ui/widgets/line_chart.dart';
import 'package:baia_ui/widgets/sells_tile.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:carousel_slider/carousel_slider.dart' show CarouselController;
// import 'package:carousel_slider/carousel_controller.dart' as carousel_slider_controller;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart' ;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> ordersList = [
    //   'Pedro #134 - \$327.12',
    //   'Pedro #135 - \$123.45',
    //   'Pedro #136 - \$543.21'
    // ];
   
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

    final List<String> tabsStringList = ["Hoy", "Esta semana", "Este mes"];

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SelectableText(
                    'Últimas órdenes',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ver todas',
                      style: hyperlinkTextStyle
                    ),
                  ),
                ],
              ),
            ),
            // CarouselSlider(
            //   items: ordersList.map((item) => LatestOrderClip(
            //     name: item["name"], 
            //     orderNumber: item["orderNumber"], 
            //     orderTotal: item["orderTotal"], 
            //     order: item["order"])).toList(), 
            //   options: CarouselOptions(
            //     aspectRatio: 2.4,
            //     autoPlay: true,
            //     enlargeCenterPage: true
            //   )),
          
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ventas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SelectableText('Ver detalles', style: hyperlinkTextStyle),
                ],
              ),
            ),
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
            const Expanded(
              child: TabBarView(
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
          ],
        ),
        
      ),
    );
  }
}

// Tab(
//                   child: Container(
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.only(left: 4),
//                     height: 20,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: const Color.fromARGB(96, 158, 158, 158)),
//                     child: const Text('Hoy'),
//                   ),
//                 ),
//               )),
//             ),