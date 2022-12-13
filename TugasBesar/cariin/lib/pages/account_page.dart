import 'package:cariin/services/signin_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  String? displayName;
  String? email;
  String? photoUrl;
  AccountPage(this.displayName, this.email, this.photoUrl, {Key? key})
      : super(key: key);

  @override
  State<AccountPage> createState() =>
      _AccountPageState(displayName, email, photoUrl);
}

class _AccountPageState extends State<AccountPage> {
  String? _displayName;
  String? _email;
  String? _photoUrl;

  _AccountPageState(this._displayName, this._email, this._photoUrl);

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: Image.network(
                    user.photoURL!,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Signed In as: ",
                  style: GoogleFonts.ubuntu(),
                ),
                Text(
                  user.email!,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Your name: ",
                  style: GoogleFonts.ubuntu(),
                ),
                Text(
                  user.displayName!,
                  style: GoogleFonts.ubuntu(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold)),
                )
              ]),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {
            signOut(context);
          },
          child: Text(
            "Sign Out",
            style: GoogleFonts.ubuntu(color: Colors.redAccent),
          ),
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              side: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
