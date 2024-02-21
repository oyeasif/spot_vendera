import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/Widget/text_widget.dart';

import '../res/color.dart';
import '../res/my_imgs.dart';
import '../res/strings.dart';
import 'button_widget.dart';
import 'clipper_container.dart';
import 'navibar.dart';

class MyDialog extends StatelessWidget {

  String svgImage,titile,text,buttonText;
  VoidCallback onpress;


  MyDialog({super.key,required this.svgImage, required this.titile, required this.text, required this.onpress, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipShadowPath(
            clipper: _MyClipper(100.sp,0.1.r),
            shadow: Shadow(
              blurRadius: 30.r,
              color: Colors.grey,
              offset: Offset(0.w  , 10.h),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25.h,horizontal: 10.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  TextStyleWidget(
                    title: titile,
                    size: 20.sp,
                    weight: FontWeight.w700,
                    color: MyColors.blueEsh10,
                  ),
                  SizedBox(height: 15.0.h),
                  TextStyleWidget(
                    title: text,
                    size: 14.sp,
                    textAlign: TextAlign.center,
                    weight: FontWeight.w600,
                    color: MyColors.lightGrey40,
                  ),
                  SizedBox(height: 25.0.h),
                  ButtonWidget(
                    title: buttonText,
                    onPress: onpress,
                    buttonColor: MyColors.primaryGreen,
                    textColor: MyColors.white,
                    borderSideColor: MyColors.primaryGreen,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -45.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40.r,
                  child: Center(child: SvgPicture.asset(svgImage)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyClipper extends CustomClipper<Path> {
  final double space;
  final double radius;

  _MyClipper(this.space, this.radius);

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width.w / 2.h;
    final halfSpace = space.w / 2.28.h;
    final curve = space.w / 10.h;
    final height = halfSpace.w / 1.25.h;
    final radiusValue = radius.r;

    path.lineTo(halfWidth.w - halfSpace.w, 0.h);
    path.quadraticBezierTo(halfWidth.w - halfSpace.w + curve.w, height.h- radiusValue.h,
        halfWidth.w, height.h - radiusValue.h);

    path.lineTo(halfWidth.w, height.h - radiusValue.h);
    path.quadraticBezierTo(halfWidth.w + halfSpace.w - curve.w, height.h - radiusValue.h,
        halfWidth.w + halfSpace.w, 0.h);

    path.lineTo(size.width.w, 0.h);
    path.lineTo(size.width.w, size.height.h);
    path.lineTo(0.w, size.height.h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

