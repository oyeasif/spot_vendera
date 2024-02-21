import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/my_imgs.dart';
import 'package:spotappui/view/authentication/forgot_password/forgot_password.dart';
import 'package:spotappui/view/authentication/login.dart';
import 'package:spotappui/view/authentication/register/register.dart';
import 'package:spotappui/widget/authentication/custom_text_field.dart';
import 'package:spotappui/widget/navibar.dart';


class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final TextEditingController _newPasswordEditingController = TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
  TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;

  @override
  void dispose() {
    _newPasswordEditingController.dispose();
    _confirmPasswordEditingController.dispose();
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
                          height: 50.h,
                        ),
                        CustomTextFormField(
                          prefixIcon: MyImgs.lock,
                          hintText: 'New Password',
                          onChanged: (value) {},
                          controller: _newPasswordEditingController,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        CustomTextFormField(
                          prefixIcon: MyImgs.lock,
                          hintText: 'Confirm Password',
                          controller: _confirmPasswordEditingController,
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 40.h,
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
                      // if (_newPasswordEditingController.text.isNotEmpty &&
                      //     _confirmPasswordEditingController.text.isNotEmpty) {
                        Get.to(Login());
                      // } else {
                      //   setState(() {
                      //     _showError = _newPasswordEditingController.text.isEmpty;
                      //     _showError =
                      //         _confirmPasswordEditingController.text.isEmpty;
                      //   });
                      // }
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
