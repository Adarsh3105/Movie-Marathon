//Custom styles for buttons, texts, gradients
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_marathon/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ButtonStyle log = ElevatedButton.styleFrom(
  primary: greyColor,
);
TextStyle centre = GoogleFonts.workSans(
  fontSize: 35.h,fontWeight: FontWeight.w800
);
TextStyle info = GoogleFonts.cookie(fontSize: 30.h, color: Colors.white);
TextStyle greet = GoogleFonts.workSans(fontSize: 30.h, color: Colors.white);

TextStyle splashScreen =
    GoogleFonts.workSans(fontSize: 40.h, color: whiteColor,fontWeight: FontWeight.w800);
TextStyle details = GoogleFonts.cookie(color: Colors.white, fontSize: 15.h);
BoxDecoration whiteGreyGradiet = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        accentColor,
        whiteColor.withOpacity(0.1),
        accentColor,
      ]),
);
BoxDecoration formGradient = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        accentColor,
        primaryColor.withOpacity(0.5),
        accentColor,
      ]),
);
BoxDecoration redBlackGradient = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        primaryColor,
        accentColor,
      ]),
);
