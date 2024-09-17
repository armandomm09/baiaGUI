import 'dart:async';

import 'package:baia_ui/constants.dart';
import 'package:baia_ui/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderBreakdown extends StatefulWidget {
  final String orderNumber;
  final order;
  const OrderBreakdown(
      {super.key, required this.orderNumber, required this.order});

  @override
  State<OrderBreakdown> createState() => _OrderBreakdownState();
}

class _OrderBreakdownState extends State<OrderBreakdown> {
  @override
  Widget build(BuildContext context) {
    
    final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    const CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#${widget.orderNumber}',
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 8, 3, 169),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Text(
                      formatCurrency(widget.order["total"]),
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text("Orden"),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: widget.order["order"]["order"]
                    .map<Widget>((item) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${item["quantity"]} ${item["servicename"]}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                formatCurrency(item["unitaryprice"]),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ubicacion"),
                  Text(
                    "Abrir en Maps",
                    style: hyperlinkTextStyle,
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
            ),
          ],
        ),
      ),
    );
  }
}
