import 'package:flutter/material.dart';
import 'package:kick_stash_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = cart[index];
            return ListTile(
              title: Text(
                item["title"],
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size : ${item['size'].toString()}"),
              leading: CircleAvatar(child: Image.asset(item['imageUrl'], width: 50, height: 50)),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Are you sure? ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text("you want to remove this product from your cart?",
                              style: Theme.of(context).textTheme.bodyMedium),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context, listen: false).removeProduct(item);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                )),
                          ],
                        );
                      });
                },
              ),
            );
          },
          shrinkWrap: true,
          itemCount: cart.length,
        ));
  }

  void onTap() {}
}
