import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  String? uid;
  String? name;
  String? desc;
  String? datelost;

  DetailPage(this.uid, this.name, this.desc, this.datelost, {Key? key})
      : super(key: key);

  @override
  State<DetailPage> createState() =>
      _DetailPageState(uid, name, desc, datelost);
}

class _DetailPageState extends State<DetailPage> {
  String? _uid;
  String? _name;
  String? _desc;
  String? _datelost;

  _DetailPageState(this._uid, this._name, this._desc, this._datelost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _name!,
              style:
                  GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(_datelost!, style: GoogleFonts.ubuntu(fontSize: 17)),
            Text(
              _desc!,
              style: GoogleFonts.ubuntu(fontSize: 20),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"))
          ],
        ),
      ),
    );
  }
}
