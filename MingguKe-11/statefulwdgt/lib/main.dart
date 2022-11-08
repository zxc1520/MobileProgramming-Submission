import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

const listItem = <String>["Kelvin", "Reamur"];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Home(
        title: "Konversi Suhu",
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;
  // int _count = 0;
  // String _newValue = "Kelvin";
  double _result = 0;

  TextEditingController myController = TextEditingController();

  void _conversionState() {
    setState(() {
      _inputUser = double.parse(myController.text);
      if (_dropDownVal == "Kelvin") {
        _result = _inputUser + 273;
      } else {
        _result = (4 / 5) * _inputUser;
      }
    });
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  String _dropDownVal = listItem.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputField(myController: myController),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<String>(
                    items:
                        listItem.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    value: _dropDownVal,
                    onChanged: (String? val) {
                      setState(() {
                        _dropDownVal = val!;
                      });
                    }),
                const Text(
                  "Hasil",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  _result.toStringAsFixed(1),
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _conversionState,
              child: Text('Konversi Suhu Ke $_dropDownVal'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
            )
          ],
        ),
      ),
    );
  }
}

class MultiResult extends StatelessWidget {
  const MultiResult({
    Key? key,
    required this.kelvindeg,
    required double kelvin,
    required this.reamurdeg,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  final String kelvindeg;
  final String reamurdeg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(kelvindeg),
            Text(
              '$_kelvin',
              style: const TextStyle(fontSize: 30),
            )
          ],
        ),
        Column(
          children: [
            Text(reamurdeg),
            Text(
              '$_reamur',
              style: const TextStyle(fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          hintText: "Masukkan Suhu dalam Celcius",
          contentPadding: EdgeInsets.all(8)),
    );
  }
}
