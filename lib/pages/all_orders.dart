import 'dart:convert';
import 'package:baia_ui/widgets/latest_orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

class AllOrders extends StatefulWidget {
  const AllOrders({super.key});

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {
  late Stream<List<dynamic>> _orderStream;
  bool orderExistance = true;

  @override
  void initState() {
    super.initState();
    _orderStream = _getOrderStream();
  }

 Stream<List<dynamic>> _getOrderStream() async* {
  while (true) {
    try {
      final url =
          Uri.parse('http://127.0.0.1:8000/Sushi_Restaurant/orders/active');
      final response = await http.get(url, headers: {
        'Cache-Control': 'no-cache',
        'Connection': 'keep-alive',
      });

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        yield jsonList;
      } else {
        // Manejar el error si la respuesta no es exitosa
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    // Esperar antes de hacer la siguiente solicitud
    await Future.delayed(Duration(seconds: 2)); // Ajusta el tiempo según sea necesario
  }
}

  getOrders() {
    if (orderExistance) {
      return StreamBuilder<List<dynamic>>(
        stream: _orderStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay órdenes activas.'));
          } else {
            final orders = snapshot.data!;

            return ListView(
              children: orders
                  .asMap()
                  .entries
                  .map((entry) {
                    int index = entry.key;
                    var order = entry.value;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: CupertinoContextMenu(
                            actions: <Widget>[
                              CupertinoContextMenuAction(
                                child: Text("Action 1"),
                                trailingIcon: CupertinoIcons.add,
                                onPressed: () {},
                              ),
                              CupertinoContextMenuAction(
                                child: Text("Action 2"),
                                trailingIcon: CupertinoIcons.add_circled,
                                onPressed: () {},
                              ),
                              CupertinoContextMenuAction(
                                child: Text("Action 3"),
                                trailingIcon: CupertinoIcons.alarm,
                                onPressed: () {},
                              ),
                            ],
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: LatestOrderClip(allOrder: orders[0]),
                            ),
                          ),
                        ),
                      ),
                    );
                  })
                  .toList()
                  .animate(interval: 0.2.seconds)
                  .slideX(duration: 400.ms)
                  .fadeIn(duration: 400.ms),
            );
          }
        },
      );
    } else {
      return const Center(
        child: Text("No data"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getOrders());
  }
}
