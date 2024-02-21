import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/text_widget.dart';


class ButtonWidget extends StatelessWidget {

  final String title;
  VoidCallback onPress = (){};
  final buttonColor;
  final textColor;
  final borderSideColor;

  ButtonWidget({Key? key, required this.title, required this.onPress, required this.buttonColor, required this.textColor,required this.borderSideColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 48.h,
        width: Get.width,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: borderSideColor),
            borderRadius: BorderRadius.circular(18.r),
          ),
          color: buttonColor,
        ),
        child: TextStyleWidget(title: title, size: 14.sp,color: textColor,weight: FontWeight.w400,),
      ),
    );
  }
}
