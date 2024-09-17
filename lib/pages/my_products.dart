import 'package:baia_ui/constants.dart';
import 'package:baia_ui/services/clientCreator/clientCreator.dart';
import 'package:baia_ui/utils.dart';
import 'package:baia_ui/widgets/menu/new_product_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyProductsPage extends StatefulWidget {
  const MyProductsPage({super.key});

  @override
  State<MyProductsPage> createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: TextButton(
              onPressed: () {
                // ClientCreator.createNewClient("greta");
                showModalBottomSheet(
                  constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 1.5),
                  context: context,
                  builder: (context) {
                    return NewItemBottomSheet(
                      onAdd: (name, price) {
                              setState(() {
                              myProductsList.add(
                                  {"name": name, "price": price});
                              });
                            },
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.038,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: mainBlueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Agregar producto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Editar",
                    style: hyperlinkTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: myProductsList
                .map((product) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${product['name']}', style: TextStyle(letterSpacing: 0.01, fontWeight: FontWeight.bold),),
                          Text('${r'$'}${product['price'].toString()}0',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ))
                .toList().animate(interval: 0.05.seconds).slideX(duration: 400.ms).fadeIn(duration: 400.ms),
          ),
        ],
      ),
    );
  }
}
