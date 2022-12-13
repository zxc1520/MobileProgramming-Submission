import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  String? uid;
  String? path;
  String? name;
  String? desc;
  String? datelost;

  DetailPage(this.uid, this.path, this.name, this.desc, this.datelost,
      {Key? key})
      : super(key: key);

  @override
  State<DetailPage> createState() =>
      _DetailPageState(uid, path, name, desc, datelost);
}

class _DetailPageState extends State<DetailPage> {
  String? _uid;
  String? _path;
  String? _name;
  String? _desc;
  String? _datelost;

  _DetailPageState(
      this._uid, this._path, this._name, this._desc, this._datelost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _path!,
              width: double.infinity,
            ),
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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            "Close",
            style: GoogleFonts.ubuntu(),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              primary: const Color(0xFF2B001D)),
        ),
      ),
    );
  }
}
