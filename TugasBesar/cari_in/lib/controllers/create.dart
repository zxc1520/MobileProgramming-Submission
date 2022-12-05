import 'package:cloud_firestore/cloud_firestore.dart';

Future createUser(
    {required String name,
    required String desc,
    required String datelost}) async {
  final document = FirebaseFirestore.instance
      .collection('LostItem')
      .doc('fjTBK4Hkq4tj0KPDZKPV');

  final json = {'name': name, 'desc': desc, 'datelost': datelost};

  await document.set(json);
}
