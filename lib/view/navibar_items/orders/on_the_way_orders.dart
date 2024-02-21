import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../../../widget/orders_screen_widget/shimmer_order_screen.dart';

class OnTheWayOrder extends StatefulWidget {
  const OnTheWayOrder({Key? key}) : super(key: key);

  @override
  State<OnTheWayOrder> createState() => _OnTheWayOrderState();
}

class _OnTheWayOrderState extends State<OnTheWayOrder> {

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


  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(33.99976204930803, 71.47600403723713),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          SizedBox(height: 15.h,),
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
              itemCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(bottom: 15.0.h,left: 15.0.w,right: 15.0.w,top: 0),
                  child: Container(
                    padding: EdgeInsets.all(12.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(strokeAlign: 0.2,width: 0.2.sp,color: MyColors.lightGrey10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.white10,
                                  ),
                                  child: Center(child: SvgPicture.asset(MyImgs.naviProfile)),
                                ),
                                SizedBox( width:  10.w,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextStyleWidget(title: Strings.muhammadJavid.tr, size: 12.sp,color: MyColors.blueEsh10,weight: FontWeight.w600,),
                                      SizedBox(height: 2.h,),
                                      Row(
                                        children: [
                                          SvgPicture.asset(MyImgs.call),
                                          Expanded(child: TextStyleWidget(title: Strings.pakPhone.tr, size: 12.sp,color: MyColors.lightGrey,weight: FontWeight.w400,)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 34.h,
                                  decoration: ShapeDecoration(
                                    color: MyColors.lightGreen10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),

                                  child: Center(child: TextStyleWidget(title: Strings.onTheWay.tr, size: 12.sp,weight: FontWeight.w400,color: MyColors.green,)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          width: 314.w,
                          height: 126.h,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                            child: GoogleMap(
                              zoomControlsEnabled: true,
                              zoomGesturesEnabled: true,
                              initialCameraPosition: _kGooglePlex,
                            ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                alignment: Alignment.center,
                                height: 56.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                                child: TextStyleWidget(title: Strings.returnOrder.tr, size: 14.sp,color: MyColors.primaryGreen,weight: FontWeight.w400,),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Container(
                                alignment: Alignment.center,
                                height: 56.h,
                                width: 145.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.r),
                                  color: MyColors.primaryGreen,
                                ),
                                child: TextStyleWidget(title: Strings.dispute.tr, size: 14.sp,color: MyColors.white,weight: FontWeight.w400,),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                );
              }
          ),
        ],
      );
  }
}

