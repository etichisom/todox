import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Field extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final Color hintColor;
  final Widget? prefixIcon, suffixIcon;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Function(String)? validate;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;
  final String? errorText;

  const Field(
      {super.key,
      this.controller,
      this.errorText,
      this.padding,
      this.height = 54,
      this.onTap,
      this.enable = true,
      this.validate,
      this.hintColor = Colors.grey,
      this.fillColor = Colors.white,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.hint = "",
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor});

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool secure = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: TextFormField(
          obscureText: secure,
          onChanged: widget.onChanged,
          enabled: widget.enable,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          validator: (e) {
            return widget.validate == null ? null : widget.validate!(e!);
          },
          decoration: InputDecoration(
            errorText: widget.errorText,
            hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: widget.hintColor),
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Transform.scale(scale: 0.7, child: widget.prefixIcon),
            suffixIcon: widget.obSecure
                ? InkWell(
                    onTap: () {
                      setSecure();
                    },
                    child: icon())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.suffixIcon ?? const SizedBox(),
                    ],
                  ),

            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide:  const BorderSide(color: Colors.red,width: 0.2),
            // ),
            fillColor: widget.fillColor,
            filled: true,
          ),
        ));
  }

  final OutlineInputBorder enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: const BorderSide(color: Colors.transparent));

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }

  Widget icon() {
    if (secure) {
      return const Icon(
        Icons.visibility_outlined,
        size: 20,
      );
    } else {
      return const Icon(
        Icons.visibility_off_outlined,
        size: 20,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.obSecure) {
      setState(() {
        secure = true;
      });
    }
  }
}

class SearchField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final Color hintColor;
  final Widget? prefixIcon, suffixIcon;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Function(String)? validate;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;

  const SearchField(
      {super.key,
      this.controller,
      this.padding,
      this.height = 54,
      this.onTap,
      this.enable = true,
      this.validate,
      this.hintColor = Colors.white,
      this.fillColor = Colors.transparent,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.hint = "",
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  bool secure = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: TextFormField(
          obscureText: secure,
          onChanged: widget.onChanged,
          enabled: widget.enable,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          validator: (e) {
            return widget.validate == null ? null : widget.validate!(e!);
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: widget.hintColor),
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon == null
                ? null
                : Transform.scale(scale: 0.7, child: widget.prefixIcon),
            suffixIcon: widget.obSecure
                ? InkWell(
                    onTap: () {
                      setSecure();
                    },
                    child: icon())
                : widget.suffixIcon,

            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(15),
            //   borderSide:  const BorderSide(color: Colors.red,width: 0.2),
            // ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: const BorderSide(color: Colors.transparent)),
            fillColor: widget.fillColor,
            filled: true,
          ),
        ));
  }

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }

  Widget icon() {
    if (secure) {
      return const Icon(
        Icons.visibility_outlined,
        size: 20,
      );
    } else {
      return const Icon(
        Icons.visibility_off_outlined,
        size: 20,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.obSecure) {
      setState(() {
        secure = true;
      });
    }
  }
}
