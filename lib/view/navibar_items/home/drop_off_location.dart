import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:spotappui/Widget/button_widget.dart';

import '../../../Widget/dotted_line.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import 'new_customer.dart';

class DropOffLocation extends StatefulWidget {
  const DropOffLocation({Key? key}) : super(key: key);

  @override
  State<DropOffLocation> createState() => _DropOffLocationState();
}

class _DropOffLocationState extends State<DropOffLocation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 260.0.h, // Adjust this as needed
        maxHeight: MediaQuery.of(context).size.height, // Full screen
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        panelBuilder: (scrollController) => _dropOffBuildPanel(scrollController),
        body: _dropOffMap(),
      ),
    );
  }

  Widget _dropOffBuildPanel(ScrollController scrollController) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 101,
              height: 4,
              decoration: ShapeDecoration(
                color: Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          TextStyleWidget(
            title: Strings.dropOffLocation.tr,
            size: 14.sp,
            weight: FontWeight.w700,
            color: MyColors.black20,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
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
                    size: Size(20.sp, 30.sp),
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
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 0.h),
                        hintText: Strings.currentLocation.tr,
                        hintStyle: GoogleFonts.poppins(
                          color: MyColors.buttonTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.14.h,
                        ),
                        filled: true,
                        fillColor: MyColors.white10,
                        suffixIcon: SizedBox(
                            height: 24.h,
                            width: 24.w,
                            child: Center(
                                child: SvgPicture.asset(
                                  MyImgs.location1,
                                  color: MyColors.buttonTextColor,
                                ))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: const BorderSide(
                            color: MyColors.white50,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: const BorderSide(
                            color: MyColors.white50,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 0.h),
                        hintText: Strings.enterDropOffLocation.tr,
                        hintStyle: GoogleFonts.poppins(
                          color: MyColors.buttonTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 0.14.h,
                        ),
                        filled: true,
                        fillColor: MyColors.white10,
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
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: const BorderSide(
                            color: MyColors.white50,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          borderSide: const BorderSide(
                            color: MyColors.white50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ButtonWidget(
            title: Strings.confirm.tr,
            onPress: () {
              Get.to(NewCustomer());
            },
            buttonColor: MyColors.primaryGreen,
            textColor: MyColors.white,
            borderSideColor: MyColors.primaryGreen,
          ),
          SizedBox(height: 10.h,),
        ],
      ),
    );
  }

  Widget _dropOffMap() {
    return Stack(
      children: [
        const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(33.99976204930803, 71.47600403723713),
            zoom: 14.4746,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Row(
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
                title: Strings.dropOffLocation.tr,
                size: 14.sp,
                color: MyColors.blueEsh10,
                weight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ],
    );
  }

}
