import 'package:dalil/core/widgets/custom_navigate.dart';
import 'package:dalil/features/on_boarding/presentation/functions/on_boarding.dart';
import 'package:dalil/features/on_boarding/presentation/widgets/onboarding_body.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/get_buttons.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              CustomNavBar(
                onTap: () {
                  onBoardingVisited();
                  customNavigate(context, '/signUp');
                },
              ),
              OnBoardingBody(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
              const SizedBox(
                height: 40,
              ),
              GetButtons(
                currentIndex: currentIndex,
                controller: _controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
