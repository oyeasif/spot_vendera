import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/my_imgs.dart';
import 'package:spotappui/view/authentication/forgot_password/forgot_password.dart';
import 'package:spotappui/view/authentication/register/register.dart';
import 'package:spotappui/view_model/controller/controller.dart';
import 'package:spotappui/widget/authentication/custom_text_field.dart';
import 'package:spotappui/widget/navibar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;

  ServiceController serviceController = Get.put(ServiceController());

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    serviceController.getLocationPermission();
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
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                        title: 'Let\'s sign you in',
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
                        title: 'Welcome back!',
                        size: 12.sp,
                        color: MyColors.lightGrey70,
                        weight: FontWeight.w400,
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextFormField(
                    prefixIcon: MyImgs.email,
                    hintText: 'Email Address',
                    onChanged: (value) {},
                    controller: _emailEditingController,
                    errorText: _showError ? '  email not found' : null,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  CustomTextFormField(
                    prefixIcon: MyImgs.lock,
                    hintText: 'Password',
                    controller: _passwordEditingController,
                    onChanged: (value) {},
                    errorText: _showError ? '  password not correct' : null,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FadeInRight(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(ForgotPassword());
                            },
                              child: TextStyleWidget(
                        title: 'Forgot Password',
                        size: 14,
                        weight: FontWeight.w400,
                        color: MyColors.primaryGreen,
                      )))),
                  SizedBox(
                    height: 25.h,
                  ),
                  FadeInUp(
                    duration: Duration(seconds: 1),
                    child: ButtonWidget(
                        title: 'Login',
                        onPress: () {
                          if (_emailEditingController.text.isNotEmpty &&
                              _passwordEditingController.text.isNotEmpty) {
                            Get.to(NaviBarWidget(currentindex: 0));
                          } else {
                            setState(() {
                              _showError = _emailEditingController.text.isEmpty;
                              _showError =
                                  _passwordEditingController.text.isEmpty;
                            });
                          }
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
                      Get.to(Register());
                    },
                    child: FadeInRight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextStyleWidget(
                            title: 'Not a member? ',
                            size: 12,
                            weight: FontWeight.w400,
                            color: MyColors.lightGrey70,
                          ),
                          TextStyleWidget(
                            title: 'Register',
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
          ),
        ),
      ),
    );
  }
}
