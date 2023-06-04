import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todox/core/theme/color.dart';

ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffF1F5F9), //const Color(0xffE0E0E0)
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Color(0xffE0E0E0), width: 1),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary900,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 16.0.sp,
    ),
  ),
);
