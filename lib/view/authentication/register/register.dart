import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/view/authentication/register/email_verification.dart';
import 'package:spotappui/view/authentication/login.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../../../widget/authentication/custom_text_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                onTap: (){
                  Get.back();
                },
                child: FadeInLeft(
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
                          border: Border.all(strokeAlign: 0.1,width: 0.7.sp,color: MyColors.blueEsh10),
                        ),
                      ),
                      SvgPicture.asset(MyImgs.backIcon),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 50.w,),
            FadeInDown(child: TextStyleWidget(title: Strings.registration.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,)),
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
                      FadeInRight(child: TextStyleWidget(title: 'Create an account', size: 28.sp,color: MyColors.fullBlack,weight: FontWeight.w600,)),
                      SizedBox(height: 15.h,),
                      BounceInDown(duration: Duration(seconds: 5), child: TextStyleWidget(title: 'Welcome back!', size: 12.sp,color: MyColors.lightGrey70,weight: FontWeight.w400,)),
                      SizedBox(height: 50.h,),
                      CustomTextFormField(prefixIcon: MyImgs.person, hintText: 'Business Name', onChanged: (value) {  },),
                      SizedBox(height: 15.h,),
                      CustomTextFormField(prefixIcon: MyImgs.email, hintText: 'Email Address', onChanged: (value) {  },),
                      SizedBox(height: 15.h,),
                      CustomTextFormField(prefixIcon: MyImgs.location2, hintText: 'Business Address', onChanged: (value) {  },),
                      SizedBox(height: 15.h,),
                      CustomTextFormField(prefixIcon: MyImgs.lock, hintText: 'Password', onChanged: (value) {  },),
                      SizedBox(height: 15.h,),
                    ],
                  ),
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(seconds: 1),
              child: ButtonWidget(title: 'Sign Up', onPress: (){
                Get.to(EmailVerification());
              }, buttonColor: MyColors.primaryGreen, textColor: MyColors.white, borderSideColor: MyColors.primaryGreen),
            ),
            SizedBox(height: 10.h,),
            GestureDetector(
              onTap: (){
                Get.to(Login());
              },
              child: FadeInRight(
                duration: Duration(seconds: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextStyleWidget(title: 'Already a member? ', size: 12,weight: FontWeight.w400,color: MyColors.lightGrey70,),
                    TextStyleWidget(title: 'Login', size: 12,weight: FontWeight.w400,color: MyColors.primaryGreen,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
