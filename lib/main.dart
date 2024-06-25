import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/routes/app_router.dart';
import 'package:dalil/core/services/service_locator.dart';
import 'package:dalil/core/utils/app_colors.dart';
import 'package:dalil/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
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
