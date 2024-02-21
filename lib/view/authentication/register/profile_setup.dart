import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/animation/scaletransition_animation.dart';
import 'package:spotappui/view/authentication/register/profile_setup_detail.dart';
import '../../../Widget/button_widget.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import 'package:image_picker/image_picker.dart';
import '../../../view_model/controller/controller.dart';
import '../login.dart';

class ProfileSetup extends StatefulWidget {
  const ProfileSetup({Key? key}) : super(key: key);

  @override
  State<ProfileSetup> createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {

  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarOpacity: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: FadeInLeft(
                  duration: Duration(seconds: 1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        height: 30.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: MyColors.lightGrey20,
                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                              strokeAlign: 0.1,
                              width: 0.7.sp,
                              color: MyColors.blueEsh10),
                        ),
                      ),
                      SvgPicture.asset(MyImgs.backIcon),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 50.w,
            ),
            FadeInDown(
              duration: Duration(seconds: 1),
              child: TextStyleWidget(
                title: Strings.profileSetup.tr,
                size: 14.sp,
                color: MyColors.blueEsh10,
                weight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      FadeInRight(
                        duration: Duration(seconds: 1),
                        child: TextStyleWidget(
                          title: 'Add Company Logo',
                          size: 28.sp,
                          color: MyColors.fullBlack,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ShakeX(
                        duration: Duration(seconds: 3),
                        child: TextStyleWidget(
                          title:
                          'Adding a logo helps the team to recognize you',
                          size: 12.sp,
                          color: MyColors.lightGrey70,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<ServiceController>().logoBottomSheet(context);
                        },
                        child: ScalesTransitionAnimation(
                          child: GetBuilder<ServiceController>(
                            init: ServiceController(),
                            builder: (getLogoImageController){
                              return getLogoImageController.logoImage != null
                                  ? CircleAvatar(
                                radius: 80.r,
                                backgroundImage: FileImage(File(getLogoImageController.logoImage!.path)),
                              )
                                  : Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 0.1)),
                                child: Center(
                                  child: SvgPicture.asset(MyImgs.camera),
                                ),
                              );
                            },
                          )
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      FadeInRight(
                          duration: Duration(seconds: 1),
                          child: TextStyleWidget(
                            title: 'Spot Delivery',
                            size: 20.sp,
                            weight: FontWeight.w600,
                            color: MyColors.fullBlack,
                          )),
                      FadeInRight(
                          duration: Duration(seconds: 1),
                          child: TextStyleWidget(
                            title: 'albustanrestaurant@gmail.com',
                            size: 16.sp,
                            weight: FontWeight.w500,
                            color: MyColors.fullBlack,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(seconds: 1),
              child: ButtonWidget(
                  title: 'Save',
                  onPress: () {
                    Get.to(const ProfileSetupDetail());
                  },
                  buttonColor: MyColors.primaryGreen,
                  textColor: MyColors.white,
                  borderSideColor: MyColors.primaryGreen),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Login());
              },
              child: BounceInDown(
                duration: Duration(seconds: 2),
                child: TextStyleWidget(
                  title: 'Skip ',
                  size: 12,
                  weight: FontWeight.w400,
                  color: MyColors.lightGrey70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
