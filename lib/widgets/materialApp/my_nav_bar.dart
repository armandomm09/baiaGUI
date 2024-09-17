import 'package:baia_ui/constants.dart';
import 'package:baia_ui/pages/all_orders.dart';
import 'package:baia_ui/pages/home_page.dart';
import 'package:baia_ui/pages/my_products.dart';
import 'package:baia_ui/pages/profile_page.dart';
import 'package:baia_ui/pages/sells_page.dart';
import 'package:flutter/material.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomePage(),
    const SellsPage(),
    const AllOrders(),
    const MyProductsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainOrangeColor,
        unselectedItemColor: mainBlueColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sell),
            label: 'Ventas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}