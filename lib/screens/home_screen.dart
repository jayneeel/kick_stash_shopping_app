import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<String> filters = const [
    "All",
    "Adidas",
    "Nike",
    "Reebok",
  ];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));

    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
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
                    border: border, focusedBorder: border, enabledBorder: border),
              ))
            ],
          ),
        ],
      )),
    );
  }
}
