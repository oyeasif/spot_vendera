import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';

class TextFieldWidget extends StatefulWidget {

  final controller;
  final prefixIcon;
  final String hintText;
  const TextFieldWidget({Key? key, required this.controller, this.prefixIcon, required this.hintText}) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: MyColors.blueEsh, fontSize: 16.sp,fontStyle: FontStyle.normal),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color(0xFF8F95AA),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0.11,
          ),
          fillColor: MyColors.textFieldColor,
          filled: true,
          prefixIcon: widget.prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: BorderSide.none,
          ),
        ),
      );
  }
}
