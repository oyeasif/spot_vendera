import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widget/button_widget.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class MyDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: MyColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30.h,),
                TextStyleWidget(title: Strings.verificationRequired.tr, size: 20, weight: FontWeight.w700,color: MyColors.blueEsh10,),
                SizedBox(height: 15.0.h),
                Text(Strings.verificationText.tr,textAlign: TextAlign.center,  style: GoogleFonts.poppins(fontWeight: FontWeight.w600, color: MyColors.lightGrey40, fontSize: 14,fontStyle: FontStyle.normal),),
                SizedBox(height: 25.0.h),
                ButtonWidget(
                  title: Strings.goToVerify.tr,
                  onPress: (){
                  },
                  buttonColor: MyColors.primaryGreen,
                  textColor: MyColors.white,
                  borderSideColor: MyColors.primaryGreen,
                ),
              ],
            ),
          ),
          Positioned(
            top: -40,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  child: Center(child: SvgPicture.asset(MyImgs.danger)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
