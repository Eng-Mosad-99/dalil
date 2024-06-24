import 'package:dalil/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;

  final String subTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnBoardingModel> onBoardingData = [
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding,
    title: 'Explore The history with Dalel in a smart way',
    subTitle:
        'Using out app\'s history libraries, you can find more historical periods',
  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding1,
    title: 'From every place on earth',
subTitle: 'A big variety of ancient places from all over the world',  ),
  OnBoardingModel(
    image: Assets.assetsImagesOnBoarding2,
    title: 'Using modern AI technology for better user experience',
    subTitle: 'AI provide recommendations and helps you to continue the search journey',
  ),
];
