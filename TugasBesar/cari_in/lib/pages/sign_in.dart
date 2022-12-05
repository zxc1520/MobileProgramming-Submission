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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _passw = TextEditingController();

  Future _signIn() async {
    await Firebase.initializeApp();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _passw.text.trim());
  }

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
                      _signIn().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      });
                    },
                    child: Text(
                      "Sign In",
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
                    text: "Don't have an account ? ",
                    style: GoogleFonts.ubuntu(color: Colors.black38),
                  ),
                  TextSpan(
                      text: "Sign Up",
                      style: GoogleFonts.ubuntu(color: Color(0xFF4A193D)),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        }))
                ])),
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
                          width: 20,
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
