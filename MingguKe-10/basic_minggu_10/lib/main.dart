import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ini Minggu Ke-10"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomTab(
                text1: "BERITA",
                text2: "HARGA",
              ),
              const SizedBox(
                height: 20,
              ),
              MainCard(),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset(
                            '../images/dell.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("Ini laptop baru jadi dari pabrik "),
                      ],
                    ),
                    Container(
                        decoration: const BoxDecoration(
                            border:
                                Border(top: BorderSide(color: Colors.green))),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: const Text("Agustus"))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.indigo)),
      child: Column(
        children: [
          Image.network(
            "https://picsum.photos/250?image=9",
            fit: BoxFit.fill,
          ),
          const Text(
            "Ada Laptop Murah woi",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: const Text("Berita"),
            color: Colors.indigo,
          )
        ],
      ),
    );
  }
}

// Widget for Static Custom Tab
class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.text1, required this.text2})
      : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text(text1), Text(text2)],
    );
  }
}
