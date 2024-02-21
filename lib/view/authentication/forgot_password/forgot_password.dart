import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/view/authentication/forgot_password/forgot_email_verify.dart';

import '../../../Widget/button_widget.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../widget/authentication/custom_text_field.dart';
import '../../../widget/navibar.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;

  @override
  void dispose() {
    _emailEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30.h,),
                        Shimmer.fromColors(
                          baseColor: MyColors.primaryGreen,
                          highlightColor: MyColors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                MyImgs.logo,
                                color: MyColors.primaryGreen,
                                width: 31.w,
                                height: 40.h,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextStyleWidget(
                                title: 'Spot',
                                size: 20.sp,
                                weight: FontWeight.w700,
                                color: MyColors.primaryGreen,
                              ),
                              TextStyleWidget(
                                title: 'Delivery',
                                size: 20.sp,
                                weight: FontWeight.w300,
                                color: MyColors.lightGrey40,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        FadeInRight(
                            duration: Duration(seconds: 1),
                            child: TextStyleWidget(
                              title: 'Forgot Password',
                              size: 28.sp,
                              color: MyColors.fullBlack,
                              weight: FontWeight.w600,
                            )),
                        SizedBox(
                          height: 15.h,
                        ),
                        BounceInDown(
                            duration: Duration(seconds: 5),
                            child: TextStyleWidget(
                              title: 'Enter your email address and we will \nsend OTP Code to you Email.',
                              size: 12.sp,
                              color: MyColors.lightGrey70,
                              weight: FontWeight.w400,
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          height: 60.h,
                        ),
                        CustomTextFormField(
                          prefixIcon: MyImgs.email,
                          hintText: 'Email Address',
                          onChanged: (value) {},
                          controller: _emailEditingController,
                          errorText: _showError ? '  email not found' : null,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FadeInUp(
                duration: Duration(seconds: 1),
                child: ButtonWidget(
                    title: 'Reset Password',
                    onPress: () {
                      if (_emailEditingController.text.isNotEmpty) {
                        Get.to(ForgotEmailVerify());
                      } else {
                        setState(() {
                          _showError = _emailEditingController.text.isEmpty;
                        });
                      }
                    },
                    buttonColor: MyColors.primaryGreen,
                    textColor: MyColors.white,
                    borderSideColor: MyColors.primaryGreen),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ),
    );
  }
}
