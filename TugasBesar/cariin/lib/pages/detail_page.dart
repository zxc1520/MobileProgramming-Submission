import 'dart:ui';

import 'package:background_app_bar/background_app_bar.dart';
import 'package:cariin/models/lost_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  String? status;

  DetailPage(
      this.uid, this.path, this.name, this.desc, this.datelost, this.status,
      {Key? key})
      : super(key: key);

  @override
  State<DetailPage> createState() =>
      _DetailPageState(uid, path, name, desc, datelost, status);
}

class _DetailPageState extends State<DetailPage> {
  String? _uid;
  String? _path;
  String? _name;
  String? _desc;
  String? _datelost;
  String? _status;

  _DetailPageState(this._uid, this._path, this._name, this._desc,
      this._datelost, this._status);

  final bool _isDisabled = false;
  final user = FirebaseAuth.instance.currentUser!;

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
              ),
              Text(
                _name!,
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Text(
                '${_status!}',
                style: GoogleFonts.ubuntu(color: const Color(0xFF2C001E)),
              ),
              Text(_datelost!, style: GoogleFonts.ubuntu(fontSize: 14)),
              Text(
                _desc!,
                style: GoogleFonts.ubuntu(fontSize: 15),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _buildClaimedButton());
  }

  Widget _buildClaimedButton() {
    final doc = FirebaseFirestore.instance.collection("LostItem").doc(_uid);
    return Container(
      width: double.infinity,
      child: OutlinedButton(
          onPressed: () {
            _isDisabled ? null : doc.update({'status': 'Claimed'});
          },
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              side: const BorderSide(color: Colors.red)),
          child: Text(_isDisabled ? "Claimed" : "Claim")),
    );
  }
}
