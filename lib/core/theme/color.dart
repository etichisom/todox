import 'package:flutter/material.dart';

class AppColors {
  static const Color primary50 = Color(0xffe6f0f5);
  static const Color primary100 = Color(0xffb0d0df);
  static const Color primary200 = Color(0xff8ab9d0);
  static const Color primary300 = Color(0xff5498bb);
  static const Color primary400 = Color(0xff3385ad);
  static const Color primary500 = Color(0xff006699);
  static const Color primary600 = Color(0xff005d8b);
  static const Color primary700 = Color(0xff00486d);
  static const Color primary800 = Color(0xff003854);
  static const Color primary900 = Color(0xff4A3780);

  static const Color accent1_50 = Color(0xfffffaeb);
  static const Color accent1_100 = Color(0xffffefc0);
  static const Color accent1_200 = Color(0xffffe8a1);
  static const Color accent1_300 = Color(0xffffdd76);
  static const Color accent1_400 = Color(0xffffd65c);
  static const Color accent1_500 = Color(0xffffcc33);
  static const Color accent1_600 = Color(0xffe8ba2e);
  static const Color accent1_700 = Color(0xffb59124);
  static const Color accent1_800 = Color(0xff8c701c);
  static const Color accent1_900 = Color(0xff6b5615);

  static const Color secondary50 = Color(0xfff0fafa);
  static const Color secondary100 = Color(0xffd0efef);
  static const Color secondary200 = Color(0xffb9e8e8);
  static const Color secondary300 = Color(0xff98dddd);
  static const Color secondary400 = Color(0xff85d6d6);
  static const Color secondary500 = Color(0xff85d6d6);
  static const Color secondary600 = Color(0xff5dbaba);
  static const Color secondary700 = Color(0xff489191);
  static const Color secondary800 = Color(0xff387070);
  static const Color secondary900 = Color(0xff2b5656);

  static const Color accent2_50 = Color(0xfff7e8e9);
  static const Color accent2_100 = Color(0xffe7b8bc);
  static const Color accent2_200 = Color(0xffdc969b);
  static const Color accent2_300 = Color(0xffcb666e);
  static const Color accent2_400 = Color(0xffc14951);
  static const Color accent2_500 = Color(0xffb21b26);
  static const Color accent2_600 = Color(0xffa21923);
  static const Color accent2_700 = Color(0xff7e131b);
  static const Color accent2_800 = Color(0xff620f15);
  static const Color accent2_900 = Color(0xff4b0b10);

  static const Color greys_50 = Color(0xfffafafa);
  static const Color greys_100 = Color(0xffefefef);
  static const Color greys_200 = Color(0xffe8e8e8);
  static const Color greys_300 = Color(0xffdddddd);
  static const Color greys_400 = Color(0xffd6d6d6);
  static const Color greys_500 = Color(0xffcccccc);
  static const Color greys_600 = Color(0xffbababa);
  static const Color greys_700 = Color(0xff919191);
  static const Color greys_800 = Color(0xff707070);
  static const Color greys_900 = Color(0xff565656);

  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

  static Color shiftHsl(Color c, [double amt = 0]) {
    var hslc = HSLColor.fromColor(c);
    return hslc.withLightness((hslc.lightness + amt).clamp(0.0, 1.0)).toColor();
  }

  static Color parseHex(String value) =>
      Color(int.parse(value.substring(1, 7), radix: 16) + 0xFF000000);

  static Color blend(Color dst, Color src, double opacity) {
    return Color.fromARGB(
      255,
      (dst.red.toDouble() * (1.0 - opacity) + src.red.toDouble() * opacity)
          .toInt(),
      (dst.green.toDouble() * (1.0 - opacity) + src.green.toDouble() * opacity)
          .toInt(),
      (dst.blue.toDouble() * (1.0 - opacity) + src.blue.toDouble() * opacity)
          .toInt(),
    );
  }
}
