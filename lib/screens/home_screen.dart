import 'package:flutter/material.dart';

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
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
              Expanded(
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
              ))
        ],
      )),
    );
  }
}
