import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:spotappui/Widget/button_widget.dart';

import '../../../Widget/dotted_line.dart';
import '../../../Widget/home_screen_widget/check_box.dart';
import '../../../Widget/home_screen_widget/customer_detail_listtile.dart';
import '../../../Widget/home_screen_widget/customer_detail_text_heading.dart';
import '../../../Widget/home_screen_widget/placed_an_order_dialogue.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/color.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  State<CustomerDetails> createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {

  bool pickup = true;
  bool delivery = true;
  bool photo = true;
  bool signature = false;

  double containerHeight = 100.0;

  bool vehicleType = false;

  int isSelectedList = 0;
  List<Container> container = [
    Container(
      child: Column(
        children: [
          SvgPicture.asset(MyImgs.bike),
        ],
      ),
    ),
  ];

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
        panelBuilder: (scrollController) => _customerDetailBuildPanel(scrollController),
        body: _customerDetailMap(),
      ),
    );
  }

  Widget _customerDetailBuildPanel(ScrollController scrollController) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
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
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextHeading(title: Strings.summary.tr),
                    GestureDetector(
                      onTap: (){},
                      child: Row(
                        children: [
                          SvgPicture.asset(MyImgs.calender),
                          SizedBox(
                            width: 5.w,
                          ),
                          TextStyleWidget(title: Strings.now.tr, size: 12,weight: FontWeight.w400,color:  MyColors.lightGrey30,),
                          SizedBox(
                            width: 3.w,
                          ),
                          SvgPicture.asset(MyImgs.arrowDown2,height: 16.h,width: 16.w,color: MyColors.buttonTextColor,),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: ShapeDecoration(
                    color: MyColors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    children: [
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
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                TextStyleWidget(
                                  title: Strings.salmiah.tr,
                                  size: 14.sp,
                                  weight: FontWeight.w400,
                                  color: MyColors.black20,
                                ),
                                SizedBox(
                                  height: 45.h,
                                ),
                                TextStyleWidget(
                                  title: Strings.kuwaitTowers.tr,
                                  size: 14.sp,
                                  weight: FontWeight.w400,
                                  color: MyColors.black20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(thickness: 0.2),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                MyImgs.speedMeter,
                                color: MyColors.white20,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextStyleWidget(
                                title: Strings.thirtyKm.tr,
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: MyColors.lightGrey30,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset(
                                MyImgs.clock,
                                color: MyColors.white20,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              TextStyleWidget(
                                title: Strings.thirtyMin.tr,
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: MyColors.lightGrey30,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.all(13.sp),
                  decoration: ShapeDecoration(
                    color: MyColors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          TextHeading(title: Strings.userInformation.tr),
                          Row(
                            children: [
                              TextStyleWidget(
                                title: Strings.showALl.tr,
                                size: 14.sp,
                                weight: FontWeight.w500,
                                color: MyColors.primaryGreen,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                MyImgs.homeArrowDown,
                                color: MyColors.primaryGreen,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.muhammadJavid.tr,
                          trailing: ''),
                      const Divider(
                        thickness: 0.2,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                MyImgs.call,
                                color: MyColors.primaryGreen,
                                height: 24.h,
                                width: 24.w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              TextStyleWidget(
                                title: Strings.pakPhone.tr,
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: MyColors.black20,
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            MyImgs.userFrame,
                            color: MyColors.lightPrimaryGreen,
                            height: 24.h,
                            width: 24.w,
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviWallet,
                          title: Strings.payment.tr,
                          trailing: Strings.cash),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.deliverable.tr,
                          trailing: Strings.home.tr),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.unitNumber.tr,
                          trailing: '456'),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.buildingNumber.tr,
                          trailing: '5250'),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.floor.tr,
                          trailing: '3rd'),
                      const Divider(
                        thickness: 0.2,
                      ),
                      CustomerListTile(
                          leading: MyImgs.naviProfile,
                          title: Strings.buildingNumber.tr,
                          trailing: '5250'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextStyleWidget(
                      title: Strings.advanceOption.tr,
                      size: 14.sp,
                      weight: FontWeight.w700,
                      color: MyColors.primaryGreen,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset(
                      MyImgs.homeArrowDown,
                      color: MyColors.primaryGreen,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: ShapeDecoration(
                    color: MyColors.white10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextHeading(title: Strings.addItems.tr),
                      TextHeading(title: Strings.proofOfDelivery.tr),
                      SizedBox(
                        height: 10.h,
                      ),
                      CheckBoxWithTitleWidget(
                          title: Strings.pickupProof.tr, pickup: pickup),
                      SizedBox(
                        height: 10.h,
                      ),
                      CheckBoxWithTitleWidget(
                          title: Strings.deliveryProof.tr, pickup: delivery),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0.w),
                        child: CheckBoxWithTitleWidget(
                            title: Strings.phone.tr, pickup: photo),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0.w),
                        child: CheckBoxWithTitleWidget(
                            title: Strings.signature.tr, pickup: signature),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextHeading(title: Strings.selectVehicle.tr),
                SizedBox(height: 10.h,),
                SizedBox(
                  height: 110.h,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(5.0.sp),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectedList = index;
                            });
                          },
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: MyColors.white10,
                                    border: Border.all(color: isSelectedList == index ? MyColors.primaryGreen : MyColors.white)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(MyImgs.bike),
                                    SizedBox(height: 3.h,),
                                    TextStyleWidget(title: Strings.bike.tr, size: 10),
                                    SizedBox(height: 3.h,),
                                    TextStyleWidget(title: Strings.kwd20.tr, size: 10,weight: FontWeight.w600,),
                                    SizedBox(height: 3.h,),
                                    Container(
                                      width: 50.w,
                                      padding: EdgeInsets.all(3.sp),
                                      decoration: BoxDecoration(
                                        color: MyColors.primaryGreen,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(child: TextStyleWidget(title: Strings.fifteenMin.tr, size: 10,color: MyColors.white,)),
                                    )
                                  ],
                                ),
                              ),
                              if(isSelectedList == index) Positioned(child: Padding(
                                padding: EdgeInsets.all(5.0.sp),
                                child: Container(
                                    width: 15.0.w,
                                    height: 15.0.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: MyColors.primaryGreen,
                                      border: Border.all(
                                        color: MyColors.primaryGreen,
                                        width: 1.0.w,
                                      ),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 10.0.sp,
                                      ),
                                    )
                                ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                Row(
                  children: [
                    TextHeading(title: Strings.notes.tr),
                    TextStyleWidget(
                      title: Strings.optional.tr,
                      size: 10.sp,
                      weight: FontWeight.w400,
                      color: MyColors.black20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      fillColor: MyColors.white10,
                      filled: true,
                      hintText: Strings.writeHere.tr,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14.sp,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.sp),
                        borderSide: BorderSide.none,
                      )),
                ),
                SizedBox(height: 10.h,),
              ],
            ),
          ),
          ButtonWidget(
            title: Strings.placeAnOrder.tr,
            onPress: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PlacedAnOrderDialogue();
                },
              );
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

  Widget _customerDetailMap() {
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
            ],
          ),
        ),
      ],
    );
  }

}
