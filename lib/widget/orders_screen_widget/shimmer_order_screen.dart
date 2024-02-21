import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../res/color.dart';
import '../../res/my_imgs.dart';

class ShimmerOrderScreen extends StatefulWidget {
  const ShimmerOrderScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerOrderScreen> createState() => _ShimmerOrderScreenState();
}

class _ShimmerOrderScreenState extends State<ShimmerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors.white,
      highlightColor: Colors.grey,
      child: ListView.builder(
          padding: EdgeInsets.only(top: 12.sp),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
                                        Container(
                                          color: Colors.white,
                                          width: 80.w,
                                          height: 24.h,
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Container(
                                          color: Colors.white,
                                          width: 100.w,
                                          height: 24.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 106.w,
                                    height: 34.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
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
                      height: 187.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 55.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    const Divider(color: MyColors.lightGrey20),
                    Container(
                      height: 30.h,
                      width: 200.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    Divider(color: MyColors.lightGrey20),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 30.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130.w,
                          height: 56.h,
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        Container(
                          width: 130.w,
                          height: 56.h,
                          padding: EdgeInsets.all(8.sp),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
