import 'package:cloud_firestore/cloud_firestore.dart';

class LostItem {
  String? uid;
  String? name;
  String? desc;
  String? datelost;

  LostItem({this.uid, this.name, this.desc, this.datelost});
}
