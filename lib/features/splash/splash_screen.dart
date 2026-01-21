import 'package:biometric_login/core/constants/app_colors.dart';
import 'package:biometric_login/core/utils/dimentions.dart';
import 'package:biometric_login/features/biometric/biometric_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BiometricPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: RichText(
          text: TextSpan(
            text: 'GO',
            style: GoogleFonts.poppins(
              fontSize: Dimentions.splashFontSize,
              color: AppColors.splashColor1,
              fontWeight: FontWeight.w200,
            ),
            children: [
              TextSpan(
                text: 'Green',
                style: GoogleFonts.poppins(
                  fontSize: Dimentions.fontSizeBig,
                  color: AppColors.splashColor2,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
