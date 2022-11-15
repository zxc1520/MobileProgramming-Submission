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
  List<String> historyItem = <String>[];

  void _conversionState() {
    setState(() {
      _inputUser = double.parse(myController.text);
      if (_dropDownVal == "Kelvin") {
        _result = _inputUser + 273;
      } else {
        _result = (4 / 5) * _inputUser;
      }
    });

    historyItem.add(_result.toString());
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  //
  String _dropDownVal = listItem.first;
  double _currentVal = 0;

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
            Slider(
              value: _currentVal,
              max: 100,
              divisions: 10,
              label: _currentVal.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentVal = value;
                  myController.text = _currentVal.toString();
                });
              },
              onChangeEnd: (double value) {
                setState(() {
                  _currentVal = value;
                  _conversionState();
                });
              },
            ),

            // InputField(myController: myController),
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
                        _conversionState();
                      });
                    }),
                const Text(
                  "Hasil",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                Text(
                  _result.toStringAsFixed(1),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                )
              ],
            ),
            ElevatedButton(
              onPressed: _conversionState,
              child: Text('Konversi Suhu Ke $_dropDownVal'),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
                child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: historyItem.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Text('Hasil dari konversi  ${historyItem[index]}'),
                );
              },
            ))
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
