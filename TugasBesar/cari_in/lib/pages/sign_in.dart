import 'package:cari_in/pages/home_page.dart';
import 'package:cari_in/pages/sign_up.dart';
import 'package:cari_in/services/signin_with_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign in",
                style: GoogleFonts.ubuntu(
                    fontSize: 25, fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/icons/icon.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png',
                          height: 20,
                        ),
                        Text(
                          "Sign In With Google",
                          style: GoogleFonts.ubuntu(color: Colors.blueAccent),
                        ),
                      ],
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        surfaceTintColor: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
