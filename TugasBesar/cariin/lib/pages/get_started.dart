import 'package:cariin/pages/sign_in.dart';
import 'package:cariin/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(
              child: Banner(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const SignIn()));
          },
          child: Text('Next', style: GoogleFonts.ubuntu()),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              primary: const Color(0xFF2B001D)),
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/icons/icon.png',
          width: 100.0,
          height: 100.0,
        ),
        const SizedBox(
          height: 30,
        ),
        Text("Welcome To CariIn !",
            style:
                GoogleFonts.ubuntu(fontSize: 25, fontWeight: FontWeight.w500)),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Barang hilang ? CariIn dong !",
          style: GoogleFonts.ubuntu(fontSize: 18, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
