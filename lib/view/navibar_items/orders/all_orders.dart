import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/res/my_imgs.dart';
import 'package:spotappui/widget/orders_screen_widget/shimmer_order_screen.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/strings.dart';

class AllOrders extends StatefulWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  State<AllOrders> createState() => _AllOrdersState();
}

class _AllOrdersState extends State<AllOrders> {

  bool isShimmer = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        isShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: TextStyleWidget(
                    title: Strings.december.tr,
                    size: 16.sp,
                    color: MyColors.blueEsh10,
                    weight: FontWeight.w700,
                  ),
                ),
              ),
              isShimmer
                  ? const ShimmerOrderScreen()
                  : ListView.builder(
                  padding: EdgeInsets.only(top: 12.sp),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: 15.0.h, left: 15.0.w, right: 15.0.w, top: 0),
                      child: Container(
                        padding: EdgeInsets.all(12.0.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                              strokeAlign: 0.2,
                              width: 0.2.sp,
                              color: MyColors.lightGrey10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.white10,
                                  ),
                                  child: Center(
                                      child:
                                          SvgPicture.asset(MyImgs.naviProfile)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextStyleWidget(
                                                  title:
                                                      Strings.muhammadJavid.tr,
                                                  size: 12.sp,
                                                  color: MyColors.blueEsh10,
                                                  weight: FontWeight.w600,
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                        MyImgs.call),
                                                    Expanded(
                                                        child: TextStyleWidget(
                                                      title:
                                                          Strings.pakPhone.tr,
                                                      size: 12.sp,
                                                      color: MyColors.lightGrey,
                                                      weight: FontWeight.w400,
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(8.sp),
                                            decoration: ShapeDecoration(
                                              color: MyColors.lightYellow,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                            ),
                                            child: Center(
                                                child: TextStyleWidget(
                                              title: Strings.placedOrder.tr,
                                              size: 12.sp,
                                              weight: FontWeight.w400,
                                              color: MyColors.yellow,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: MyColors.white60,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextStyleWidget(
                                    title: Strings.vender.tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: MyColors.black20,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: Strings.venderLocation.tr,
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: MyColors.white50,
                                      ),
                                      prefixIcon: SizedBox(
                                          height: 24.h,
                                          width: 24.w,
                                          child: Center(
                                              child: SvgPicture.asset(
                                            MyImgs.location1,
                                            color: MyColors.buttonTextColor,
                                          ))),
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0.h),
                                      fillColor: MyColors.white10,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.white50,
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.white50,
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  TextStyleWidget(
                                    title: Strings.customer.tr,
                                    size: 14,
                                    weight: FontWeight.w400,
                                    color: MyColors.black20,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: Strings.customerLocation.tr,
                                      hintStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: MyColors.white50,
                                      ),
                                      prefixIcon: SizedBox(
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
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0.h, horizontal: 10.w),
                                      fillColor: MyColors.white10,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.white50,
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: MyColors.white50,
                                            width: 1.w),
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0.h),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextStyleWidget(
                                    title: Strings.scheduleOrder.tr,
                                    size: 14.sp,
                                    weight: FontWeight.w400,
                                    color: MyColors.blueEsh10,
                                  )),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0.h),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextStyleWidget(
                                    title: 'Sat Dec 01:36 PM to 02:00 PM',
                                    size: 12.sp,
                                    weight: FontWeight.w400,
                                    color: MyColors.lightGrey30,
                                  )),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(color: MyColors.lightGrey20),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0.h),
                              child: Row(
                                children: [
                                  TextStyleWidget(
                                    title: Strings.deliveryOnBike.tr,
                                    size: 14.sp,
                                    weight: FontWeight.w400,
                                    color: MyColors.black,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SvgPicture.asset(MyImgs.bike),
                                ],
                              ),
                            ),
                            Divider(color: MyColors.lightGrey20),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextStyleWidget(
                                  title: Strings.totalKWD.tr,
                                  size: 16.sp,
                                  weight: FontWeight.w700,
                                  color: MyColors.blueEsh10,
                                ),
                                TextStyleWidget(
                                  title: Strings.cash.tr,
                                  size: 12.sp,
                                  weight: FontWeight.w400,
                                  color: MyColors.yellow,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 56.h,
                                    width: 145.w,
                                    child: TextStyleWidget(
                                      title: Strings.cancelOrder.tr,
                                      size: 14.sp,
                                      color: MyColors.primaryGreen,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 56.h,
                                    width: 145.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18.r),
                                      color: MyColors.primaryGreen,
                                    ),
                                    child: TextStyleWidget(
                                      title: Strings.edit.tr,
                                      size: 14.sp,
                                      color: MyColors.white,
                                      weight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          );
  }
}
