import 'package:TShop/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:TShop/features/authentication/screens.onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:TShop/features/authentication/screens.onboarding/widgets/onboarding_next_button.dart';
import 'package:TShop/features/authentication/screens.onboarding/widgets/onboarding_page.dart';
import 'package:TShop/features/authentication/screens.onboarding/widgets/onboarding_skip.dart';
import 'package:TShop/utils/constants/image_string.dart';
import 'package:TShop/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // horizontal scroll pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onboardingTitle1,
                subTittle: TTexts.onboardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onboardingTitle2,
                subTittle: TTexts.onboardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onboardingTitle3,
                subTittle: TTexts.onboardingSubTitle3,
              ),
            ],
          ),
          // skip button
          const OnBoardingSkip(),
          // Dot navigation smoothPageIndicator
          const OnBoardingDotNavigation(),
          // circular button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}


