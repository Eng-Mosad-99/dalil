import 'package:dalil/core/database/cache/cache_helper.dart';
import 'package:dalil/core/utils/app_strings.dart';
import 'package:dalil/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_navigate.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isOnBoardingShown =
        CacheHelper().getData(key: 'isOnBoardingShown') ?? false;
    if (isOnBoardingShown == true) {
      delayedNavigate(context, '/signUp');
    } else {
      delayedNavigate(context, '/onBoarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}

void delayedNavigate(context, String path) {
  Future.delayed(
    const Duration(seconds: 3),
  ).then((value) {
    customReplacementNavigate(context, path);
  });
}
