import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/res/color.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {

  bool showMoreText = false;

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
            TextStyleWidget(title: Strings.faqs.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  TextStyleWidget(title: Strings.youHaveAnyQuestion.tr, size: 24.sp,color: MyColors.blueEsh,weight: FontWeight.w500,),
                  SizedBox(height: 10.h,),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: MyColors.textFieldColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: Strings.search.tr,
                      prefixIcon: const Icon(Icons.search),
                    ),

                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleWidget(title: Strings.frequentlyAsked.tr, size: 20.sp,weight: FontWeight.w500,color: MyColors.black10,),
                      TextStyleWidget(title: Strings.viewAll.tr, size: 16.sp,weight: FontWeight.w700,color: MyColors.black,),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(strokeAlign: 0.2,width: 0.2.w,color: MyColors.lightGrey10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextStyleWidget(title: Strings.loremTitle.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                        TextStyleWidget(title: Strings.loremText.tr, size: 12.sp,weight: FontWeight.w400,color: MyColors.lightGrey,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(strokeAlign: 0.2,width: 0.2.w,color: MyColors.lightGrey10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextStyleWidget(title: Strings.loremTitle.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                        TextStyleWidget(title: Strings.loremText.tr, size: 12.sp,weight: FontWeight.w400,color: MyColors.lightGrey,),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(strokeAlign: 0.2,width: 0.2.w,color: MyColors.lightGrey10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextStyleWidget(title: Strings.loremTitle.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                        TextStyleWidget(title: Strings.loremText.tr, size: 12.sp,weight: FontWeight.w400,color: MyColors.lightGrey,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ButtonWidget(
                title: Strings.loadMore.tr,
                onPress: (){},
                buttonColor: MyColors.textFieldColor,
                textColor: MyColors.blueEsh,
              borderSideColor: MyColors.textFieldColor,
            ),
          ],
        ),
      ),
    );
  }
}
