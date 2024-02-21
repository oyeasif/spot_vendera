import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:spotappui/animation/scaletransition_animation.dart';
import 'package:spotappui/view/authentication/register/profile_setup.dart';
import '../../../Widget/button_widget.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../login.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {

  bool codeCompleted = false;
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
                title: Strings.verification.tr,
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
                      SizedBox(height: 80.h,),
                      FadeInRight(
                        child: TextStyleWidget(
                          title: 'Verify Email',
                          size: 28.sp,
                          color: MyColors.fullBlack,
                          weight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      ScalesTransitionAnimation(
                        child: TextStyleWidget(
                          title: 'Enter verification code we have sent to',
                          size: 12.sp,
                          color: MyColors.lightGrey70,
                          weight: FontWeight.w400,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ScalesTransitionAnimation(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextStyleWidget(
                              title: 'your email ',
                              size: 12.sp,
                              color: MyColors.lightGrey70,
                              weight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                            TextStyleWidget(
                              title: 'albustanrestaurant@gmail.com',
                              size: 12.sp,
                              color: MyColors.fullBlack,
                              weight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      BounceInDown(
                        duration: Duration(seconds: 2),
                        child: PinCodeTextField(
                          length: 4,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.bold,
                          ),
                          validator: (v) {
                            if (v!.length < 4) {
                              return "not correct";
                            } else {
                              return null;
                            }
                          },
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 60,
                            fieldWidth: 80,
                            activeColor: MyColors.white70,
                            activeFillColor: MyColors.white70,
                            selectedFillColor: MyColors.white70,
                            selectedColor: MyColors.white70,
                            inactiveFillColor: MyColors.white70,
                            inactiveColor: MyColors.white70,
                            activeBorderWidth: 1,
                            inactiveBorderWidth: 1,
                            selectedBorderWidth: 1,
                          ),
                          cursorColor: Colors.black,
                          textStyle: TextStyle(fontSize: 20, height: 1.6),
                          keyboardType: TextInputType.number,
                          onCompleted: (v) {
                            print("Completed");
                            // setState(() {
                            //   codeCompleted = !codeCompleted;
                            // });
                          },
                          animationDuration: Duration(milliseconds: 300),
                          onChanged: (value) {
                            setState(() {
                            });
                          }, appContext: context,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInUp(
              duration: Duration(seconds: 1),
              child: ButtonWidget(
                  title: 'Verify',
                  onPress: () {
                    Get.to(ProfileSetup());
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
              child: FadeInRight(
                duration: Duration(seconds: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextStyleWidget(
                      title: 'Didn\'t receive the OTP? ',
                      size: 12,
                      weight: FontWeight.w400,
                      color: MyColors.lightGrey70,
                    ),
                    TextStyleWidget(
                      title: 'Resend OTP',
                      size: 12,
                      weight: FontWeight.w400,
                      color: MyColors.primaryGreen,
                    ),
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
