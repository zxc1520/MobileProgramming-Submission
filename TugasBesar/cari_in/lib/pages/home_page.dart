import 'dart:io';

import 'package:cari_in/controllers/lost_item.dart';
import 'package:cari_in/models/lost_item.dart';
import 'package:cari_in/pages/create_page.dart';
import 'package:cari_in/pages/detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(20),
                    child: Image.network(
                      user.photoURL!,
                      width: 35,
                      height: 35,
                    ),
                  ),
                )
              ],
            ),
            WelcomeScreen(user: user),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<List<LostItem>>(
                  stream: readLost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text("Something wrong !");
                    } else if (snapshot.hasData) {
                      final item = snapshot.data!;

                      return Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: item
                              .map((lostitem) => buildItem(lostitem, context))
                              .toList(),
                        ),
                      );
                    } else {
                      return Center(
                        child: const CircularProgressIndicator(),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2C001E),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const CreatePage())));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildItem(LostItem lostItem, BuildContext context) => ListTile(
        title: Text(
          lostItem.name ?? "",
          style: GoogleFonts.ubuntu(),
        ),
        subtitle: Text(lostItem.desc ?? "", style: GoogleFonts.ubuntu()),
        trailing: Image.file(File(lostItem.path ?? "")),
        onTap: () {
          final doc = FirebaseFirestore.instance
              .collection('LostItem')
              .doc(lostItem.uid);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(lostItem.uid, lostItem.name,
                  lostItem.desc, lostItem.datelost)));
          // Navigator.pushNamed(context, '/detail', arguments: doc);
        },
      );
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, ${user.displayName}",
          style: GoogleFonts.ubuntu(fontSize: 30, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 30,
        ),
        TextFormField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              hintText: "Search Anything that you've lost",
              hintStyle: GoogleFonts.ubuntu()),
        ),
      ],
    );
  }
}
