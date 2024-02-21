import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/view/navibar_items/profile/verification_detail.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class Verification extends StatefulWidget {
  const Verification({Key? key}) : super(key: key);

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.h,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      height: 30.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(strokeAlign: 0.1,width: 0.7.sp,color: MyColors.blueEsh10),
                      ),
                    ),
                    SvgPicture.asset(MyImgs.backIcon),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            TextStyleWidget(title: Strings.verification.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: 346.w,
                    height: 328.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: const Color(0xFFF3F4F6)),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(MyImgs.verifying),
                          TextStyleWidget(
                            title: Strings.verifyingYourIdentity.tr,
                            size: 16.sp,
                            weight: FontWeight.w700,
                            color: MyColors.black20,
                          ),
                          TextStyleWidget(
                            title: Strings.verifyText.tr,
                            size: 15.sp,
                            weight: FontWeight.w500,
                            color: MyColors.lightGrey30,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ListTile(
                    leading: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F9FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                      ),
                      child:
                          Center(child: SvgPicture.asset(MyImgs.personalCard)),
                    ),
                    title: TextStyleWidget(
                      title: Strings.takePictureID.tr,
                      size: 14.sp,
                      weight: FontWeight.w600,
                      color: MyColors.black20,
                    ),
                    subtitle: TextStyleWidget(
                      title: Strings.imageSavedOnce.tr,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: MyColors.lightGrey30,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF7F9FD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.r),
                        ),
                      ),
                      child:
                          Center(child: SvgPicture.asset(MyImgs.personalCard)),
                    ),
                    title: TextStyleWidget(
                      title: Strings.takePictureIBAN.tr,
                      size: 14.sp,
                      weight: FontWeight.w600,
                      color: MyColors.black20,
                    ),
                    subtitle: TextStyleWidget(
                      title: Strings.imageSavedOnce.tr,
                      size: 14.sp,
                      weight: FontWeight.w400,
                      color: MyColors.lightGrey30,
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget(
              title: Strings.proceed.tr,
              onPress: () {
                Get.to(VerificationDetail());
              },
              buttonColor: MyColors.primaryGreen,
              textColor: MyColors.white,
              borderSideColor: MyColors.primaryGreen,
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(MyImgs.lock1),
                SizedBox(
                  width: 5.w,
                ),
                TextStyleWidget(
                  title: Strings.infoEncrypted.tr,
                  size: 10.sp,
                  weight: FontWeight.w500,
                  color: MyColors.lightGrey30,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
