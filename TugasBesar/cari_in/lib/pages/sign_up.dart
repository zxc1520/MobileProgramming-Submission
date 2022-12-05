import 'package:cari_in/pages/home_page.dart';
import 'package:cari_in/pages/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passw = TextEditingController();

  Future _register() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(), password: _passw.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style:
                  GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w500),
            ),
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
                TextFormField(
                  controller: _email,
                  style: const TextStyle(
                    color: Color(0XFF360828),
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          borderSide:
                              const BorderSide(color: Color(0xFF360828))),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.ubuntu()),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _passw,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0)),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.ubuntu()),
                ),
                const SizedBox(
                  height: 35,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _register();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.ubuntu(),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        primary: const Color(0xFF320624)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Already have an account ? ",
                    style: GoogleFonts.ubuntu(color: Colors.black38),
                  ),
                  TextSpan(
                      text: "Sign In",
                      style: GoogleFonts.ubuntu(color: Color(0xFF4A193D)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignIn()));
                        }))
                ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
