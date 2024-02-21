import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/color.dart';

class PrefixTextFieldWidget extends StatelessWidget {
  final String hintText, prefixIcon;

  PrefixTextFieldWidget(
      {Key? key, required this.hintText, required this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          color: MyColors.buttonTextColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          height: 0.14.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: MyColors.white50,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(
            color: MyColors.white50,
          ),
        ),
        filled: true,
        fillColor: MyColors.white,
        prefixIcon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Center(
                child: SvgPicture.asset(
                  prefixIcon,
                  color: MyColors.buttonTextColor,
                ))),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
