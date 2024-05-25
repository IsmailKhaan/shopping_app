// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/data.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:shopping_app/pages/product_detail.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/widgets/product_card.dart';

class ShoppingMain extends StatefulWidget {
  const ShoppingMain({super.key});

  @override
  State<ShoppingMain> createState() => _ShoppingMainState();
}

class _ShoppingMainState extends State<ShoppingMain> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> catagories = const ['All', 'Addidas', 'Nike', 'Bata'];

  int selectedCatagoryIndex = 0;

  updateIndex(index) {
    selectedCatagoryIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<CartProvider>().loginData;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'WELCOME！${user.toString()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Logout Successfully!')));
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()),
                        );
                      },
                      child: const Row(
                        children: [Text('Logout'), Icon(Icons.logout)],
                      ))
                ],
              ),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(fontWeight: FontWeight.bold),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50)))),
                ))
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  itemCount: catagories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final catagory = catagories[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            updateIndex(index);
                          });
                        },
                        child: Chip(
                          label: Text(catagory),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          backgroundColor: selectedCatagoryIndex == index
                              ? const Color.fromRGBO(254, 254, 1, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                          side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProductDetails(
                            productIndex: index,
                          );
                        }));
                      },
                      child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          index: index),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
