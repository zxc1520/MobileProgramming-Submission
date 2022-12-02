import 'package:flutter/material.dart';
import 'package:nav_app/models/item.dart';

class HomePage extends StatelessWidget {
  //const HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(name: 'Sugar', price: 12000),
    Item(name: 'Salt', price: 12000),
    Item(name: 'Egg', price: 12000),
    Item(name: 'Mirin', price: 12000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation App"),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item',
                      arguments: items[index]);
                },
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(child: Text(item.name)),
                        Expanded(
                            child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                        ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
