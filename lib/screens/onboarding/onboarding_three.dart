import 'package:e_commerce/colors/color.dart';
import 'package:e_commerce/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingThree extends StatelessWidget {
  const OnboardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Container(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    'Latest Outfits',
                    style: GoogleFonts.caveat(
                      color: AppColors.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Express your self through the art of fashionism',
                    style: GoogleFonts.eagleLake(
                      color: AppColors.black,
                      fontSize: 9,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset('assets/images/welcome3.jpg', height: 500),
            ),
            SizedBox(height: 30),
            Center(
              child: SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {
                    _completeOnboarding(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: GoogleFonts.ubuntu(
                          color: AppColors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _completeOnboarding(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_done', true); // ✅ Save flag

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const DashboardScreen()),
  );
}
