import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth.dart';
import '../../themes/font_size.dart';
import '../widgets/common/onboarding_card.dart';
import '../widgets/common/text.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  List onboardingData = [
    {
      'title': 'onboard_title_one',
      'description': 'onboard_description_one',
      'image': 'assets/images/onboard_one.png',
    },
    {
      'title': 'onboard_title_two',
      'description': 'onboard_description_two',
      'image': 'assets/images/onboard_two.png',
    },
    {
      'title': 'onboard_title_three',
      'description': 'onboard_description_three',
      'image': 'assets/images/onboard_three.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(height: AppFontSize.paddingSizeDefault),

          /// skip button
          InkWell(
            onTap: () {
              AuthController.to.setOnBoardDataAfterScreenCompleted();
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CommonText(
                  text: AuthController.to.onboardingSelectedIndex !=
                          onboardingData.length - 1
                      ? 'skip'
                      : "",
                  fontWeight: FontWeight.w600,
                  fontSize: AppFontSize.fontSizeLarge,
                  fontColor: Theme.of(context).hintColor.withOpacity(.8),
                ),
              ),
            ),
          ),

          ///page view builder
          Expanded(
            child: PageView.builder(
              itemCount: onboardingData.length,
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: OnboardingCard(
                    title: "${onboardingData[index]['title']}",
                    description: "${onboardingData[index]['description']}",
                    image: "${onboardingData[index]['image']}",
                  ),
                );
              },
              onPageChanged: (index) {
                AuthController.to.onboardingSelectedIndex = index;
              },
            ),
          ),

          /// page indicators
          Padding(
            padding: const EdgeInsets.all(AppFontSize.paddingSizeDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pageIndicators(onboardingData, context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Obx(
                      () => CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                        value: (AuthController.to.onboardingSelectedIndex + 1) /
                            onboardingData.length,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    if (AuthController.to.onboardingSelectedIndex ==
                        onboardingData.length - 1) {
                      AuthController.to.setOnBoardDataAfterScreenCompleted();
                    } else {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: Obx(
                        () => Icon(
                          AuthController.to.onboardingSelectedIndex ==
                                  onboardingData.length - 1
                              ? Icons.check
                              : Icons.navigate_next,
                          color: Colors.white,
                          size: 20,
                        ),
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    ));
  }

  pageIndicators(var onBoardingList, BuildContext context) {
    List<Widget> indicators = [];

    for (int i = 0; i < onBoardingList.length; i++) {
      indicators.add(Obx(
        () => Container(
          width: i == AuthController.to.onboardingSelectedIndex ? 20 : 10,
          height: 10,
          margin: const EdgeInsets.only(right: 8),
          decoration: BoxDecoration(
            color: i == AuthController.to.onboardingSelectedIndex
                ? Theme.of(context).primaryColor
                : Theme.of(context).hintColor,
            borderRadius: i == AuthController.to.onboardingSelectedIndex
                ? BorderRadius.circular(50)
                : BorderRadius.circular(25),
          ),
        ),
      ));
    }
    return indicators;
  }
}
