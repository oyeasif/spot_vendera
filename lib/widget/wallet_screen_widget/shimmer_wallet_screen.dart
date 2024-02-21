import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/color.dart';
import '../../res/strings.dart';
import '../button_widget.dart';

class ShimmerWalletScreen extends StatefulWidget {
  const ShimmerWalletScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerWalletScreen> createState() => _ShimmerWalletScreenState();
}

class _ShimmerWalletScreenState extends State<ShimmerWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                child: Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        color: Colors.white,
                        height: 15.w,
                        width: 80.h,
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Container(
                        color: Colors.white,
                        height: 25.w,
                        width: 120.h,
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      ButtonWidget(
                        title: Strings.addFunds.tr,
                        onPress: () {
                        },
                        buttonColor: MyColors.primaryGreen,
                        textColor: MyColors.white,
                        borderSideColor: MyColors.primaryGreen,
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Container(
                        color: Colors.white,
                        height: 20.w,
                        width: 120.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                color: Colors.white,
                height: 35.w,
                width: 200.h,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey,
            child: Container(
              width: 346.w,
              height: 56.h,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 10.h),
                    width: 347.w,
                    height: 57.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
