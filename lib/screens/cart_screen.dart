import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product_data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart ${Provider.of<String>(context)}", style: Theme.of(context).textTheme.titleMedium,),
        centerTitle: true,
      ),
      body: ListView.builder(itemBuilder: (context, index){
        final item = cart[index];
        return ListTile(
          title: Text(item["title"], style: Theme.of(context).textTheme.bodySmall,),
          subtitle: Text("Size : ${item['size'].toString()}"),
          leading: CircleAvatar(child: Image.asset(item['imageUrl'], width: 50, height: 50)),
          trailing: IconButton(icon: const Icon(Icons.delete, color: Colors.red,), onPressed: (){},),
        );
      }, shrinkWrap: true, itemCount: cart.length,)
    );
  }
}
