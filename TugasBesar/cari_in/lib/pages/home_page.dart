import 'package:cari_in/pages/create_page.dart';
import 'package:cari_in/pages/get_started.dart';
import 'package:cari_in/services/signin_with_google.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.menu),
                Image.network(
                  user.photoURL!,
                  width: 25,
                  height: 25,
                )
              ],
            ),
            Column(
              children: [
                Text(
                  "Hi, ${user.displayName}",
                  style: GoogleFonts.ubuntu(
                      fontSize: 30, fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                      hintText: "Search Anything that you've lost",
                      hintStyle: GoogleFonts.ubuntu()),
                ),
              ],
            ),
            // ListView()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const CreatePage())));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Stream<List<User>> readUser() => FirebaseFirestore.instance.collection('LostItem')
}
