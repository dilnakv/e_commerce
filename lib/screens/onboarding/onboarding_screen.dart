import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/screens/onboarding/onboarding_one.dart';
import 'package:e_commerce/screens/onboarding/onboarding_three.dart';
import 'package:e_commerce/screens/onboarding/onboarding_two.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _pages = [
    OnboardingOne(),
    OnboardingTwo(),
    OnboardingThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 200,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _pages.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColors.primary,
                  dotColor: AppColors.grey,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
