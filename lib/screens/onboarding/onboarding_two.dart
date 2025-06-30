import 'package:e_commerce/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingTwo extends StatelessWidget {
  const OnboardingTwo({super.key});

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
                    'Discover Trends',
                    style: GoogleFonts.caveat(
                      color: AppColors.primary,
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Now we are here to provide variety of best fashion',
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
              child: Image.asset('assets/images/welcome2.jpg', height: 500),
            ),
          ],
        ),
      ),
    );
  }
}
