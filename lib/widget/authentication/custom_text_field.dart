import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/color.dart';

class CustomTextFormField extends StatefulWidget {
  final String prefixIcon, hintText;
  final controller;
  final errorText;
  final ValueChanged<String> onChanged;
  CustomTextFormField(
      {super.key, required this.prefixIcon, required this.hintText, this.controller, required this.onChanged, this.errorText});

  @override
  State<CustomTextFormField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFormField> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        color: _isFocused ? MyColors.primaryGreen : MyColors.black,
        fontSize: 14.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      focusNode: _focusNode,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 0.w),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: _isFocused ? MyColors.primaryGreen : MyColors.white80,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0.12.h,
        ),
        prefixIcon: SizedBox(
            height: 24.h,
            width: 24.w,
            child: Center(
                child: SvgPicture.asset(
                  widget.prefixIcon,
                  color: _isFocused ? MyColors.primaryGreen : MyColors.black,
                ))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: MyColors.white70,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: MyColors.primaryGreen,
          ),
        ),
        errorText: widget.errorText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: MyColors.red,
          ),
        ),
        errorStyle: TextStyle(
          color: MyColors.red,
          fontSize: 14.sp,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0.12.h,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(
            color: MyColors.red,
          ),
        ),
      ),
    );
  }
}
