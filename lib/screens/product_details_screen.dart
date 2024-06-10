import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final Map<String, dynamic> product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedSize = 0;

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
          Text(widget.product['title'], style: Theme.of(context).textTheme.titleLarge,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(widget.product['imageUrl']),
          ),
          const Spacer(flex: 2,),
          Container(
            height: 250,
            decoration: BoxDecoration(
            color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('\$${widget.product['price']}', style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 60,
                  child: ListView.builder(itemBuilder: (context, index){
                    final size = widget.product['sizes'][index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(label: Text(size.toString()), backgroundColor: (selectedSize == size) ? Theme.of(context).primaryColor : const Color.fromRGBO(245, 247, 249, 1),)),
                    );
                  }, scrollDirection: Axis.horizontal, itemCount: widget.product['sizes'].length,
                  shrinkWrap: true,),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton.icon(onPressed: (){}, style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity,50),
                  ), icon: const Icon(Icons.shopping_cart_outlined),
                  label: const Text("Add to Cart", style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
