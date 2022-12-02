import 'package:flutter/material.dart';
import 'package:nav_app/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Item list = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(title: const Text("Item Page")),
      body: Center(
        child: Column(
          children: [Text(list.name), Text(list.price.toString())],
        ),
      ),
    );
  }
}
