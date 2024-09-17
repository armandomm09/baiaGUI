import 'package:baia_ui/utils.dart';
import 'package:flutter/material.dart';

class LatestOrderClip extends StatelessWidget {
  final dynamic allOrder;

  const LatestOrderClip({super.key, required this.allOrder});

  @override
  Widget build(BuildContext context) {
    const fillText =
        "3 Hamburguesa con queso, hamburguesa hawaiana, agua de horchata, agua de ...";

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 0.4),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order #${allOrder["ID"].toString().substring(9, 11)}',
                style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, color: Colors.grey, decoration: TextDecoration.none),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 8, 3, 169),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    formatCurrency(allOrder["total"]),
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal, decoration: TextDecoration.none),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Separador entre la fila y el texto
          Text(
            fillText,
            style: const TextStyle(height: 1.1, fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black, decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
