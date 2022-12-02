import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/home_page.dart';
import 'package:flutter_firebase/sign_in.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(user.photoURL!),
              const Text(
                "Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(user.displayName!),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(user.email!),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const MyHomePage();
                  }), ModalRoute.withName('/'));
                },
                child: const Text("Sign Out"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
