import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/pages/dashboard.dart';
import 'package:flutter_firebase/sign_in.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png",
                width: 200,
                height: 200,
              ),
              SignInButton()
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          signInWithGoogle().then((result) {
            if (result != null) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return DashBoard();
                },
              ));
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png",
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Google Sign in"),
          ],
        ),
        style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.all(25),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(40)))));
  }
}
