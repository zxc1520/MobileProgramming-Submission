import 'package:cariin/models/lost_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future createLost(
    {required String path,
    required String name,
    required String desc,
    required String datelost,
    required String status}) async {
  final document = FirebaseFirestore.instance.collection('LostItem').doc();

  final lostitem = LostItem(
      path: path,
      uid: document.id,
      name: name,
      desc: desc,
      datelost: datelost,
      status: status);
  final json = lostitem.toJson();

  await document.set(json);
}

Stream<List<LostItem>> readLost() => FirebaseFirestore.instance
    .collection('LostItem')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => LostItem.fromJson(doc.data())).toList());

Future<LostItem?> readLostId() async {
  final document = FirebaseFirestore.instance.collection('LostItem').doc('');
}
