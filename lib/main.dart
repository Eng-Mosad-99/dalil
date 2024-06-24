import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/routes/app_router.dart';
import 'package:dalil/core/utils/app_colors.dart';
import 'package:dalil/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
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
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite,
      ),
    );
  }
}
