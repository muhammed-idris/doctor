import 'package:doctor/core/constants/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class TextStyles {
  TextStyles._();

  static final TextStyle display = GoogleFonts.inter(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColor.primary,
  );

  static final TextStyle appBar = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );

  static final TextStyle appBarTitle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
  );

  static final TextStyle headline1 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static final TextStyle subtitle = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColor.primary,
  );

  static final TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static final TextStyle headline2 = GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
  );

  static final TextStyle numbers = GoogleFonts.inter(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
    height: 1.1,
    letterSpacing: -0.5,
  );

  static final TextStyle body = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
    height: 1.5,
  );

  static final TextStyle overline = GoogleFonts.inter(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
  );

  static final TextStyle buttonSmall = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static final TextStyle success = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.success,
  );

  static final TextStyle badge = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: GridColor.red50,
    letterSpacing: 0.5,
  );
}
