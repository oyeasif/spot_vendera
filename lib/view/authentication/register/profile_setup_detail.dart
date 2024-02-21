import 'dart:developer';
import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/animation/scaletransition_animation.dart';
import 'package:spotappui/view_model/controller/controller.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../../../widget/authentication/custom_text_field.dart';

class ProfileSetupDetail extends StatefulWidget {
  const ProfileSetupDetail({Key? key}) : super(key: key);

  @override
  State<ProfileSetupDetail> createState() => _ProfileSetupDetailState();
}

class _ProfileSetupDetailState extends State<ProfileSetupDetail> {

  List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  List<bool> selected = List.generate(7, (index) => false);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ScalesTransitionAnimation(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          GetBuilder<ServiceController>(
                            init: ServiceController(),
                            builder: (getProfileImageController) {
                            return getProfileImageController.profileImage != null ?
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: FadeInImage(
                                placeholder: FileImage(File(getProfileImageController.profileImage!.path)),
                                image: FileImage(File(getProfileImageController.profileImage!.path)),
                                fit: BoxFit.cover,
                                width: 100.w,
                                height: 100.h,
                              ),
                            )
                                : CircleAvatar(
                              radius: 50.r,
                              child: Text('Select image',style: TextStyle(fontSize: 10.sp),textAlign: TextAlign.center,),);

                          },),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                Get.find<ServiceController>().profileBottomSheet(context);
                              },
                              child: Container(
                                width: 24.w,
                                height: 24.h,
                                decoration: const BoxDecoration(
                                  color: MyColors.white100,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(MyImgs.camera2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: MyColors.fullBlack,
                      highlightColor: MyColors.yellow,
                      loop: 3,
                      child: TextStyleWidget(
                        title: 'Spot Delivery',
                        size: 16.sp,
                        weight: FontWeight.w600,
                        color: MyColors.fullBlack,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    FadeIn(
                      duration: Duration(seconds: 3),
                      child: TextStyleWidget(
                        title: 'spotdelivery@gmail.com',
                        size: 12.sp,
                        weight: FontWeight.w500,
                        color: MyColors.fullBlack,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    CustomTextFormField(
                      prefixIcon: MyImgs.person,
                      hintText: 'Business Name',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    TextFormField(
                      maxLines: 5,
                      style: TextStyle(
                        color: MyColors.black,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Business Description',
                        hintStyle: TextStyle(
                          color: MyColors.white80,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.12.h,
                        ),
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
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      prefixIcon: MyImgs.call2,
                      hintText: 'Phone number',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: MyColors.white70),
                      ),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: days.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 7),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(5.0.sp),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selected[index] = !selected[index];
                                      log(days[index].toString());
                                    });
                                  },
                                  child: Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selected[index]
                                          ? MyColors.primaryGreen
                                          : MyColors.lightGrey60,
                                    ),
                                    child: Center(
                                      child: TextStyleWidget(
                                        title: days[index].toString().tr,
                                        size: 14.sp,
                                        color: selected[index]
                                            ? Colors.white
                                            : MyColors.blueEsh10,
                                        weight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    serviceController.startTime(context);
                                  });
                                },
                                child: Container(
                                  width: 144.w,
                                  height: 57.h,
                                  padding: EdgeInsets.only(left: 10.w),
                                  decoration: BoxDecoration(
                                    color: MyColors.white10,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextStyleWidget(
                                        title: 'Start Time',
                                        size: 10,
                                        weight: FontWeight.w400,
                                        color: MyColors.white90,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      GetBuilder<ServiceController>(
                                        init: ServiceController(),
                                        builder: (startController) {
                                          return TextStyleWidget(
                                            title: startController.start != null ? '${startController.start!.hour}:${startController.start!.minute}' : 'time',
                                            size: 14,
                                            weight: FontWeight.w400,
                                            color: MyColors.black,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  serviceController.endTime(context);
                                },
                                child: Container(
                                  width: 144.w,
                                  height: 57.h,
                                  padding: EdgeInsets.only(left: 10.w),
                                  decoration: BoxDecoration(
                                    color: MyColors.white10,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextStyleWidget(
                                        title: 'End Time',
                                        size: 10,
                                        weight: FontWeight.w400,
                                        color: MyColors.white90,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      GetBuilder<ServiceController>(
                                        init: ServiceController(),
                                        builder: (endController) {
                                        return
                                          TextStyleWidget(
                                            title: endController.end != null ? '${endController.end!.hour}:${endController.end!.minute}' : 'time',
                                            size: 14,
                                            weight: FontWeight.w400,
                                            color: MyColors.black,
                                          );
                                      },),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextFormField(
                      prefixIcon: MyImgs.location2,
                      hintText: 'Location',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(seconds: 1),
              child: ButtonWidget(
                  title: 'Submit',
                  onPress: () {},
                  buttonColor: MyColors.primaryGreen,
                  textColor: MyColors.white,
                  borderSideColor: MyColors.primaryGreen),
            ),
          ],
        ),
      ),
    );
  }

}
