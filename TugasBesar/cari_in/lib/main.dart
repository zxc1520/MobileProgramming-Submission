import 'package:cari_in/pages/detail_page.dart';
import 'package:cari_in/pages/get_started.dart';
import 'package:cari_in/pages/sign_up.dart';
import 'package:cari_in/services/app_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppLauncher(),
      debugShowCheckedModeBanner: false,
      // routes: {'/detail': (context) => const DetailPage()},
    );
  }
}
