import 'package:flutter/material.dart';
import 'package:kick_stash_app/data/product_data.dart';
import 'package:kick_stash_app/screens/product_details_screen.dart';
import 'package:kick_stash_app/widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Reebok", "Bata"];
  late String selected;

  @override
  void initState() {
    super.initState();
    selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border),
              ))
            ],
          ),
          SizedBox(
              height: 100,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  String filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = filter;
                        });
                      },
                      child: Chip(
                        labelStyle: const TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        label: Text(
                          filters[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                        backgroundColor: (selected == filter)
                            ? Theme.of(context).copyWith().primaryColor
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(color: Color.fromRGBO(245, 247, 249, 1)),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  );
                },
                itemCount: filters.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = products[index];
                return InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(product: product,))),
                  child: ProductCard(
                    title: product['title'],
                    price: product['price'],
                    imageUrl: product['imageUrl'],
                    backgroundColor: index.isEven ? const Color.fromRGBO(216, 240, 253, 1) : const Color.fromRGBO(245, 247, 249, 1),
                  ),
                );
              },
              itemCount: products.length,
              shrinkWrap: true,
            ),
          )
        ],
      )),
    );
  }
}
