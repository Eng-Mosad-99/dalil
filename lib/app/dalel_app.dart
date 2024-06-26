
import 'package:dalil/core/routes/app_router.dart';
import 'package:dalil/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

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
