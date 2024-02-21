import 'dart:async';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/widget/home_screen_widget/shimmer_home_screen.dart';
import '../Models/barchart.dart';
import '../Widget/home_screen_widget/column_widget.dart';
import '../Widget/text_widget.dart';
import '../res/color.dart';
import '../res/my_imgs.dart';
import '../res/strings.dart';
import 'navibar_items/home/pickup_location.dart';
import 'navibar_items/profile/notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedMonth = 'Month'.tr;
  List<String> months = [
    'Jan'.tr,
    'Feb'.tr,
    'Mar'.tr,
    'Apr'.tr,
    'May'.tr,
    'June'.tr,
    'July'.tr,
    'Aug'.tr,
    'Sep'.tr,
    'Oct'.tr,
    'Nov'.tr,
    'Dec'.tr,
  ];

  bool isShimmer = true;
  bool isDropdownOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        isShimmer = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    BarChartModel barChartModel = BarChartModel(
      date26: 26,
      date27: 18,
      date28: 27,
      date29: 13,
      date30: 30,
      date31: 17,
    );
    barChartModel.InitializeBarData();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 70.h,
          scrolledUnderElevation: 0,
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(const Notifications());
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
            ? const ShimmerHomeScreen()
            : Container(
                padding: EdgeInsets.all(13.sp),
                decoration: const BoxDecoration(color: MyColors.background),
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleWidget(
                                title: Strings.totalOrders.tr,
                                size: 12.sp,
                                weight: FontWeight.w400,
                                color: MyColors.black20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          TextStyleWidget(
                            title: '100'.tr,
                            size: 16.sp,
                            weight: FontWeight.w700,
                            color: MyColors.black20,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            height: 200.h,
                            child: BarChart(
                              BarChartData(
                                titlesData: const FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                maxY: 40,
                                minY: 0,
                                borderData: FlBorderData(show: false),
                                gridData: FlGridData(
                                  checkToShowVerticalLine: (value) => false,
                                ),
                                barTouchData: BarTouchData(),
                                barGroups: barChartModel.barData.map((data) {
                                  return BarChartGroupData(
                                    x: data.x,
                                    barRods: [
                                      BarChartRodData(
                                          toY: data.y,
                                          color: MyColors.black20,
                                          width: 25.w,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8
                                                .r), // Set the top-left corner radius
                                            topRight: Radius.circular(8.r),
                                          ),
                                          backDrawRodData:
                                              BackgroundBarChartRodData(
                                                  show: true,
                                                  toY: 50,
                                                  color: Colors.transparent))
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  border: Border.all(
                                      width: 1.sp, color: MyColors.lightGrey50),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 36.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                        color: MyColors.textFieldColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                            width: 7.08.w,
                                            height: 12.40.h,
                                            child: SvgPicture.asset(
                                                MyImgs.arrowUp)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextStyleWidget(
                                          title: Strings.todayCOD.tr,
                                          size: 10.sp,
                                          weight: FontWeight.w400,
                                          color: MyColors.lightGrey,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        TextStyleWidget(
                                          title: Strings.kwd155.tr,
                                          size: 10.sp,
                                          weight: FontWeight.w700,
                                          color: MyColors.blueEsh20,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  border: Border.all(
                                      width: 1.sp, color: MyColors.lightGrey50),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 36.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                        color: MyColors.textFieldColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: SizedBox(
                                            width: 7.08.w,
                                            height: 12.40.h,
                                            child: SvgPicture.asset(
                                                MyImgs.arrowDown)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextStyleWidget(
                                          title: Strings.walletBalance.tr,
                                          size: 10.sp,
                                          weight: FontWeight.w400,
                                          color: MyColors.lightGrey,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        TextStyleWidget(
                                          title: Strings.kwdPrice.tr,
                                          size: 10.sp,
                                          weight: FontWeight.w700,
                                          color: MyColors.blueEsh20,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: MyColors.white,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: ColumnWidget(
                                      title: Strings.placedOrders.tr,
                                      icon: MyImgs.checkOrder,
                                      subtitle: '30',
                                      arrowIcon: MyImgs.arrowForward,
                                      arrowIconColor: MyColors.yellow),
                                ),
                                ColumnWidget(
                                    title: Strings.deliveredOrders.tr,
                                    icon: MyImgs.deliveryVein,
                                    subtitle: '20'.tr,
                                    arrowIcon: MyImgs.arrowForward,
                                    arrowIconColor: MyColors.green),
                                ColumnWidget(
                                    title: Strings.onTheWay.tr,
                                    icon: MyImgs.routing,
                                    subtitle: '150',
                                    arrowIcon: MyImgs.arrowForward,
                                    arrowIconColor: MyColors.red),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const PickUpLocation());
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                                color: MyColors.primaryGreen,
                              ),
                              child: Center(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.0.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(MyImgs.box),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          TextStyleWidget(
                                            title: Strings.placedOrder.tr,
                                            size: 14.sp,
                                            color: MyColors.white,
                                            weight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.chevron_right,
                                          color: MyColors.white, size: 24.sp),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 80.w,
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isDropdownOpen = !isDropdownOpen;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                decoration: ShapeDecoration(
                                  color: MyColors.lightGrey20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedMonth != selectedMonth;
                                        });
                                      },
                                      child: TextStyleWidget(
                                        title: selectedMonth.tr,
                                        size: 11.sp,
                                        color: MyColors.black,
                                        weight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(width: 3.w),
                                    SvgPicture.asset(
                                      MyImgs.arrowDown2,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (isDropdownOpen)
                              Container(
                                height: 500.h,
                                padding: EdgeInsets.all(10.sp),
                                decoration: ShapeDecoration(
                                  color: Colors.grey[200],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: months.map<Widget>((String value) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedMonth = value;
                                          isDropdownOpen = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.h),
                                        child: Text(value.tr),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
