import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/View/navibar_items/profile/verification.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/strings.dart';
import 'package:spotappui/widget/wallet_screen_widget/shimmer_wallet_screen.dart';

import '../res/my_imgs.dart';
import '../widget/alert_dialogue.dart';
import 'navibar_items/profile/notifications.dart';
import 'navibar_items/wallet/add_money.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        scrolledUnderElevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(Notifications());
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.1.w,
                    color: MyColors.white20,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Badge(
                child: Icon(
                  Icons.notifications_none_outlined,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: isShimmer
          ? const ShimmerWalletScreen()
          : Container(
        padding: EdgeInsets.all(15.sp),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: MyColors.background),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        TextStyleWidget(
                          title: Strings.totalAmount.tr,
                          size: 12.sp,
                          color: MyColors.black20,
                          weight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        TextStyleWidget(
                          title: Strings.kwdPrice.tr,
                          size: 20.sp,
                          color: MyColors.black20,
                          weight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 15.w,
                        ),
                        ButtonWidget(
                          title: Strings.addFunds.tr,
                          onPress: () {
                            Get.to(AddMoney());
                          },
                          buttonColor: MyColors.primaryGreen,
                          textColor: MyColors.white,
                          borderSideColor: MyColors.primaryGreen,
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MyDialog(
                                  svgImage: MyImgs.danger,
                                  titile: Strings.verificationRequired.tr,
                                  text: Strings.verificationText.tr,
                                  onpress: () {
                                    Get.to(Verification());
                                  },
                                  buttonText: Strings.goToVerify.tr,
                                );
                              },
                            );
                          },
                          child: TextStyleWidget(
                            title: Strings.withdrawFunds.tr,
                            size: 14.sp,
                            color: MyColors.primaryGreen,
                            weight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyleWidget(
                    title: Strings.allTransactions.tr,
                    size: 20.sp,
                    color: MyColors.blueEsh,
                    weight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: Strings.search.tr,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide.none),
                  prefixIcon: Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Center(child: SvgPicture.asset(MyImgs.searchIcon)),
                  ),
                  suffixIcon: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child:
                      Center(child: SvgPicture.asset(MyImgs.fieldSuffix))),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                TextStyleWidget(
                                  title: Strings.withdrawal.tr,
                                  size: 14,
                                  weight: FontWeight.w700,
                                  color: MyColors.blueEsh,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                TextStyleWidget(
                                  title: Strings.orderNo.tr,
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: MyColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                TextStyleWidget(
                                  title: Strings.transitionNo.tr,
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: MyColors.lightGrey,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextStyleWidget(
                                  title: Strings.walletTime.tr,
                                  size: 12,
                                  weight: FontWeight.w500,
                                  color: MyColors.lightGrey,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(MyImgs.arrowUp),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    TextStyleWidget(
                                      title: Strings.kwdPrice500.tr,
                                      size: 14.sp,
                                      color: MyColors.blueEsh20,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
