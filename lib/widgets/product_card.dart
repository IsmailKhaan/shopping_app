import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final int index;
  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: index.isEven
              ? const Color.fromRGBO(216, 240, 253, 1)
              : const Color.fromRGBO(245, 247, 249, 1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            price.toString(),
            style: const TextStyle(fontSize: 16),
          ),
          Center(child: Image.asset(image, height: 175)),
        ],
      ),
    );
  }
}
