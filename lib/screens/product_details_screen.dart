import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Text(product['title'], style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(product['imageUrl']),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
            color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              children: [
                Text('\$${product['price']}', style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 5,),
                SizedBox(
                  height: 40,
                  child: ListView.builder(itemBuilder: (context, index){
                    return Chip(label: Text(product['sizes'][index].toString()));
                  }, scrollDirection: Axis.horizontal, itemCount: product['sizes'].length,
                  shrinkWrap: true,),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
