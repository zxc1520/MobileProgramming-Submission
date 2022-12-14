import 'package:cariin/pages/get_started.dart';
import 'package:cariin/pages/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String? name, email, imageUrl;

Future<String?> signInWithGoogle() async {
  await Firebase.initializeApp();
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  if (user != null) {
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    if (name!.contains(" ")) {
      name = name!.substring(0, name!.indexOf(" "));
    }
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User? currentUser = _auth.currentUser;
    assert(user.uid == currentUser!.uid);
    return '$user';
  }
  return null;
}

Future signOut(BuildContext context) async {
  await _auth.signOut().then((value) => Navigator.of(context)
      .pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SignIn()),
          (route) => false));
}
