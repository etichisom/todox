import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todox/core/theme/color.dart';

class SvgButton extends StatelessWidget {
  final String text, asset;
  final double height, width, textSize, borderRadius;
  final Color color, textColor;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final Widget? child;
  final double? elevation;

  const SvgButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 56,
    this.color = AppColors.white,
    this.width = double.maxFinite,
    this.borderRadius = 24,
    this.textColor = Colors.black,
    this.textSize = 15,
    this.fontWeight = FontWeight.w400,
    this.elevation = 1,
    this.child,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation ?? 0,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            )),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(asset),
                  SizedBox(width: 10.w,),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: textSize.sp,
                      fontWeight: fontWeight,
                      color: textColor,
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
