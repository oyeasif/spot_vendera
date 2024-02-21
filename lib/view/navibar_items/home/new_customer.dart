import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:spotappui/Widget/button_widget.dart';

import '../../../Widget/dotted_line.dart';
import '../../../Widget/home_screen_widget/prefix_textfield.dart';
import '../../../Widget/home_screen_widget/suffix_textfield.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import 'customer_details.dart';

class NewCustomer extends StatefulWidget {
  const NewCustomer({Key? key}) : super(key: key);

  @override
  State<NewCustomer> createState() => _NewCustomerState();
}

class _NewCustomerState extends State<NewCustomer> {
  int isSelectedList = 0;
  List<String> location = [
    Strings.home.tr,
    Strings.office.tr,
    Strings.other.tr
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
                        color: Colors.transparent,
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
              title: Strings.newCustomer.tr,
              size: 14.sp,
              color: MyColors.blueEsh10,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                      color: MyColors.white10,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            SvgPicture.asset(
                              MyImgs.location,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            CustomPaint(
                              size: Size(
                                  20.sp, 45.sp), // Adjust the size of the line
                              painter: DottedLinePainter(),
                            ),
                            SvgPicture.asset(
                              MyImgs.location1,
                              color: MyColors.primaryGreen,
                              width: 13.w,
                              height: 13.h,
                            ),
                            SvgPicture.asset(
                              MyImgs.orderBox,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SuffixTextFieldWidget(
                                  hintText: Strings.yourLocation.tr,
                                  suffixIcon: MyImgs.location1),
                              SizedBox(
                                height: 20.h,
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 15.h),
                                  hintText: Strings.destination.tr,
                                  hintStyle: GoogleFonts.poppins(
                                    color: MyColors.buttonTextColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 0.14.h,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.white50,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.white50,
                                      )),
                                  filled: true,
                                  fillColor: MyColors.white,
                                  suffixIcon: SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            MyImgs.location1,
                                            color: MyColors.buttonTextColor,
                                            height: 11.h,
                                            width: 11.w,
                                          ),
                                          SvgPicture.asset(
                                            MyImgs.orderBox,
                                            color: MyColors.buttonTextColor,
                                          ),
                                        ],
                                      ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PrefixTextFieldWidget(
                      hintText: Strings.userName.tr,
                      prefixIcon: MyImgs.homeProfile),
                  SizedBox(
                    height: 10.h,
                  ),
                  PrefixTextFieldWidget(
                      hintText: Strings.email, prefixIcon: MyImgs.sms),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 346.w,
                    height: 55.h,
                    padding: EdgeInsets.only(
                      left: 20.w,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: MyColors.white50),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {},
                      onInputValidated: (bool value) {},
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: PhoneNumber(isoCode: 'TR'),
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputBorder: const OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {},
                      inputDecoration: InputDecoration(
                        hintText: Strings.phone.tr,
                        hintStyle: GoogleFonts.poppins(
                          color: MyColors.buttonTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.14.h,
                        ),
                        contentPadding: EdgeInsets.zero,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: MyColors.white,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SuffixTextFieldWidget(
                      hintText: Strings.selectGovernorate.tr,
                      suffixIcon: MyImgs.homeArrowDown),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 60.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: location.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(5.0.sp),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelectedList = index;
                                log(location[index].toString());
                              });
                            },
                            child: Container(
                              height: 50.h,
                              width: 100.w,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.98.w,
                                    color: isSelectedList == index
                                        ? MyColors.primaryGreen
                                        : MyColors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(14.r),
                                ),
                              ),
                              child: Center(
                                child: TextStyleWidget(
                                  title: location[index].toString().tr,
                                  size: 16.sp,
                                  color: isSelectedList == index
                                      ? MyColors.primaryGreen
                                      : MyColors.blueEsh10,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SuffixTextFieldWidget(
                      hintText: Strings.buildingNumber.tr, suffixIcon: ''),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.0.w),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              hintText: Strings.floor.tr,
                              hintStyle: GoogleFonts.poppins(
                                color: MyColors.buttonTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.14.h,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: const BorderSide(
                                  color: MyColors.white50,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: const BorderSide(
                                  color: MyColors.white50,
                                ),
                              ),
                              filled: true,
                              fillColor: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8.0.w),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 15.h),
                              hintText: Strings.unit.tr,
                              hintStyle: GoogleFonts.poppins(
                                color: MyColors.buttonTextColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                height: 0.14.h,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: const BorderSide(
                                  color: MyColors.white50,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: const BorderSide(
                                  color: MyColors.white50,
                                ),
                              ),
                              filled: true,
                              fillColor: MyColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            ButtonWidget(
                title: Strings.save.tr,
                onPress: () {
                  Get.to(const CustomerDetails());
                },
                buttonColor: MyColors.primaryGreen,
                textColor: MyColors.white,
                borderSideColor: MyColors.primaryGreen),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
