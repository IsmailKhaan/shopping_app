import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          centerTitle: true,
        ),
        body: cartData.isNotEmpty
            ? ListView.builder(
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                  final data = cartData[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(data['imageUrl']),
                      backgroundColor: Colors.amber,
                      radius: 30,
                    ),
                    title: Text(
                      data['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text('Size: ${data['size'].toString()}'),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                    title: const Text('Delect Product'),
                                    content: const Text(
                                        'Do you want to delete this product form cart?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'No',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<CartProvider>()
                                                .removeProduct(data);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(color: Colors.red),
                                          )),
                                    ]);
                              });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                })
            : const Center(child: Text('Your cart is empty')));
  }
}
