import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/widget/navibar.dart';

import '../../../Widget/button_widget.dart';
import '../../../Widget/profile_screen_widgets/text_form_field.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../../../view_model/controller/controller.dart';
import '../../../widget/alert_dialogue.dart';

class VerificationDetail extends StatefulWidget {
  const VerificationDetail({Key? key}) : super(key: key);

  @override
  State<VerificationDetail> createState() => _VerificationDetailState();
}

class _VerificationDetailState extends State<VerificationDetail> {
  ServiceController controller = Get.put(ServiceController());

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
                onTap: () {
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
            SizedBox(
              width: 20.w,
            ),
            TextStyleWidget(
              title: Strings.verification.tr,
              size: 14.sp,
              color: MyColors.blueEsh10,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    TextStyleWidget(
                      title: Strings.companyName.tr,
                      size: 16.sp,
                      weight: FontWeight.w700,
                      color: MyColors.black20,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFieldWidget(
                      controller: controller.nameController.value,
                      hintText: Strings.userName.tr,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextStyleWidget(
                      title: Strings.location.tr,
                      size: 16.sp,
                      weight: FontWeight.w700,
                      color: MyColors.black20,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFieldWidget(
                        controller: controller.emailController.value,
                        hintText: Strings.location.tr,
                        prefixIcon: SizedBox(
                            height: 25,
                            width: 25,
                            child: Center(
                                child: SvgPicture.asset(
                              MyImgs.location1,
                              height: 24,
                              width: 24,
                            )))),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextStyleWidget(
                      title: Strings.phoneLabel.tr,
                      size: 16.sp,
                      weight: FontWeight.w700,
                      color: MyColors.black20,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFieldWidget(
                      controller: controller.phoneController.value,
                      hintText: Strings.phone.tr,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(15.sp),
                      width: 346.w,
                      height: 146.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        shadows: [
                          BoxShadow(
                            color: const Color(0x0F1C2261),
                            blurRadius: 70.r,
                            offset: const Offset(0, 10),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 323.w,
                            height: 56.h,
                            padding: EdgeInsets.all(8.sp),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.w, color: const Color(0xFF307D7E)),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextStyleWidget(
                                  title: Strings.uploadLogo.tr,
                                  size: 14.sp,
                                  weight: FontWeight.w500,
                                  color: MyColors.primaryGreen,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(MyImgs.profileAvatar)),
                            title: TextStyleWidget(
                              title: Strings.logoPng.tr,
                              size: 12.sp,
                              weight: FontWeight.w600,
                              color: MyColors.black,
                            ),
                            trailing: SvgPicture.asset(MyImgs.trash),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                title: Strings.submit.tr,
                onPress: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return MyDialog(
                        svgImage: MyImgs.checkCircle,
                        titile: Strings.SuccessfullySubmit.tr,
                        text: Strings.submitText.tr,
                        onpress: () {
                          Get.to(NaviBarWidget(currentindex: 3));
                        },
                        buttonText: Strings.backToProfile.tr,
                      );
                    },
                  );
                },
                buttonColor: MyColors.primaryGreen,
                textColor: MyColors.white,
                borderSideColor: MyColors.primaryGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
