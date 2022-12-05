import 'package:cari_in/pages/get_started.dart';
import 'package:cari_in/services/signin_with_google.dart';
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
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "Email",
                style: GoogleFonts.ubuntu(),
              ),
              Text(
                user.email!,
                style: GoogleFonts.ubuntu(),
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return const GetStarted();
                    }), ModalRoute.withName('/'));
                  },
                  child: Text("signout"))
            ],
          ),
        ),
      ),
    );
  }
}
