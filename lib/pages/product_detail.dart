import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ProductDetails extends StatefulWidget {
  final int productIndex;

  const ProductDetails({super.key, required this.productIndex});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            products[widget.productIndex]['title'].toString(),
            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
                products[widget.productIndex]['imageUrl'].toString()),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$ ${products[widget.productIndex]['price'].toString()}',
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 16),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            (products[widget.productIndex]['sizes'] as List)
                                .length,
                        itemBuilder: (context, index) {
                          final size = (products[widget.productIndex]['sizes']
                              as List)[index];
                          if (selectedSize == 0) {
                            selectedSize = (products[widget.productIndex]
                                ['sizes'] as List)[0];
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSize = (products[widget.productIndex]
                                      ['sizes'] as List)[index];
                                });
                              },
                              child: Chip(
                                label: Text(size.toString()),
                                backgroundColor: size == selectedSize
                                    ? const Color.fromRGBO(254, 254, 1, 1)
                                    : Colors.white,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CartProvider>().addProduct(
                        {
                          'id': products[widget.productIndex]['id'],
                          'title': products[widget.productIndex]['title'],
                          'price': products[widget.productIndex]['price'],
                          'imageUrl': products[widget.productIndex]['imageUrl'],
                          'company': products[widget.productIndex]['company'],
                          'size': selectedSize,
                        },
                      );
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Added to Cart Successfully!')));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(254, 254, 1, 1),
                        minimumSize: const Size(double.infinity, 50)),
                    child: const Text('Add to Cart')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
