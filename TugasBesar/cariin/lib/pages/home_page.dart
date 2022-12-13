import 'dart:io';

import 'package:cariin/controllers/lost_item.dart';
import 'package:cariin/models/lost_item.dart';
import 'package:cariin/pages/account_page.dart';
import 'package:cariin/pages/create_page.dart';
import 'package:cariin/pages/detail_page.dart';
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
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AccountPage(
                            user.displayName, user.email, user.photoURL)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(20),
                      child: Image.network(
                        user.photoURL!,
                        width: 35,
                        height: 35,
                      ),
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
      resizeToAvoidBottomInset: false,
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

  Widget buildItem(LostItem lostItem, BuildContext context) => Card(
        elevation: 2.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            lostItem.name ?? "",
            style: GoogleFonts.ubuntu(),
          ),
          subtitle: Text(lostItem.desc ?? "", style: GoogleFonts.ubuntu()),
          leading: Image.network(
            lostItem.path!,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          onTap: () {
            final doc = FirebaseFirestore.instance
                .collection('LostItem')
                .doc(lostItem.uid);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailPage(lostItem.uid, lostItem.path,
                    lostItem.name, lostItem.desc, lostItem.datelost)));
            // Navigator.pushNamed(context, '/detail', arguments: doc);
          },
        ),
      );
}

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  final TextEditingController _search = TextEditingController();

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
          controller: _search,
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
