import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart'; // Import the package

import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import 'drop_off_location.dart';

class PickUpLocation extends StatefulWidget {
  const PickUpLocation({Key? key}) : super(key: key);

  @override
  State<PickUpLocation> createState() => _PickUpLocationState();
}

class _PickUpLocationState extends State<PickUpLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 230.0.h, // Adjust this as needed
        maxHeight: MediaQuery.of(context).size.height, // Full screen
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        panelBuilder: (scrollController) => _pickUpBuildPanel(scrollController),
        body: _pickUpMap(),
      ),
    );
  }

  Widget _pickUpBuildPanel(ScrollController scrollController) {
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
            title: Strings.pickUpLocation.tr,
            size: 14.sp,
            weight: FontWeight.w700,
            color: MyColors.black20,
          ),
          SizedBox(height: 10.h),
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: Strings.enterLocationCustomer.tr,
              hintStyle: GoogleFonts.poppins(
                color: MyColors.buttonTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                height: 0.14.h,
              ),
              filled: true,
              fillColor: MyColors.white10,
              prefixIcon: SizedBox(
                height: 24.h,
                width: 24.w,
                child: Center(
                  child: SvgPicture.asset(
                    MyImgs.location1,
                    color: MyColors.buttonTextColor,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ButtonWidget(
            title: Strings.pickup.tr,
            onPress: () {
              Get.to(DropOffLocation());
            },
            buttonColor: MyColors.primaryGreen,
            textColor: MyColors.white,
            borderSideColor: MyColors.primaryGreen,
          ),
        ],
      ),
    );
  }

  Widget _pickUpMap() {
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
                title: Strings.pickUpLocation.tr,
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
