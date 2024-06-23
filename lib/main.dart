import 'package:dalil/core/utils/app_assets.dart';
import 'package:dalil/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Dalil());
}

class Dalil extends StatelessWidget {
  const Dalil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Image.asset(
          Assets.assetsImagesOnBoarding1,
        ),
      ),
    );
  }
}
