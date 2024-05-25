import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart.dart';
import 'package:shopping_app/pages/shopping_main.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  int currentPageIndex = 0;
  final pages = const [ShoppingMain(), Cart()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPageIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPageIndex,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: Colors.amber[400],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Colors.amber[400],
              ),
              label: '')
        ],
      ),
    );
  }
}
