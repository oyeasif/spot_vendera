import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/widget/navibar.dart';

import '../../res/color.dart';
import '../../res/my_imgs.dart';
import '../../res/strings.dart';
import '../button_widget.dart';
import '../text_widget.dart';

class PlacedAnOrderDialogue extends StatelessWidget {
  const PlacedAnOrderDialogue({super.key});


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
                TextStyleWidget(title: Strings.orderSuccessful.tr, size: 20.sp, weight: FontWeight.w700,color: MyColors.blueEsh10,textAlign: TextAlign.center,),
                SizedBox(height: 15.0.h),
                TextStyleWidget(title: Strings.orderSuccessfulText.tr, size: 14.sp,textAlign: TextAlign.center,weight: FontWeight.w600,color: MyColors.lightGrey40,),
                SizedBox(height: 25.0.h),
                ButtonWidget(
                  title: Strings.backToHome.tr,
                  onPress: (){
                    Get.to(NaviBarWidget(currentindex: 0));
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
                  child: Center(child: SvgPicture.asset(MyImgs.checkCircle)),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
