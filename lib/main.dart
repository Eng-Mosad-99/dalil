import 'package:dalil/app/dalel_app.dart';
import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/functions/check_state_changes.dart';
import 'package:dalil/core/services/service_locator.dart';
import 'package:dalil/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // dependency injection
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  //firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkStateChanges();
  runApp(const Dalil());
}
