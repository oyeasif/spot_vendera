import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/res/color.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';


class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            TextStyleWidget(title: Strings.generalSetting.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: TextStyleWidget(title: Strings.switchTitle.tr, size: 14.sp,weight: FontWeight.w500,color: MyColors.blueEsh,),
                subtitle: TextStyleWidget(title: Strings.switchSubTitle.tr, size: 12.sp,weight: FontWeight.w400,color: MyColors.lightGrey,),
                trailing: Switch(value: switchValue, onChanged: (bool value) {
                  setState(() {
                    switchValue = value;
                  });
                },activeTrackColor: MyColors.primaryGreen,),
              ),
              SizedBox(height: 20.h,),
              Divider(thickness: 0.4.w),
              SizedBox(height: 20.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: 327.w,
                height: 98.h,
                decoration: ShapeDecoration(
                  color: MyColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: const Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextStyleWidget(title: Strings.miniAmount.tr, size: 12.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1D2644),
                        fontSize: 24.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.05.h,
                        letterSpacing: -0.20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 35),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding:  EdgeInsets.all(15.sp),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF9FAFB),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            ),
                            child: Text(
                              Strings.kwd.tr,
                              style: TextStyle(
                                color: const Color(0xFF6B7280),
                                fontSize: 16.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 0.09.h,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                        ),
                        suffixIcon: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Center(child: SvgPicture.asset(MyImgs.edit1))),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                width: 327.w,
                height: 98.h,
                decoration: ShapeDecoration(
                  color: MyColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: const Color(0xFFE5E7EB)),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleWidget(title: Strings.maxiAmount.tr, size: 12.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                    SizedBox(height: 10.h,),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFF1D2644),
                        fontSize: 24.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        height: 0.05.h,
                        letterSpacing: -0.20,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 35),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding:  EdgeInsets.all(15.sp),
                            decoration: ShapeDecoration(
                              color: const Color(0xFFF9FAFB),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                            ),
                            child: Text(
                              Strings.kwd.tr,
                              style: TextStyle(
                                color: const Color(0xFF6B7280),
                                fontSize: 16.sp,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 0.09.h,
                                letterSpacing: 0.30,
                              ),
                            ),
                          ),
                        ),
                        suffixIcon: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Center(child: SvgPicture.asset(MyImgs.edit1))),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
