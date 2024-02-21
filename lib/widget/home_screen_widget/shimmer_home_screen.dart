import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../Models/barchart.dart';
import '../../res/color.dart';

class ShimmerHomeScreen extends StatefulWidget {
  const ShimmerHomeScreen({Key? key}) : super(key: key);

  @override
  State<ShimmerHomeScreen> createState() => _ShimmerHomeScreenState();
}

class _ShimmerHomeScreenState extends State<ShimmerHomeScreen> {
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
    return Container(
      padding: EdgeInsets.all(13.sp),
      decoration: const BoxDecoration(color: MyColors.background),
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Shimmer.fromColors(
              baseColor: MyColors.white,
              highlightColor: Colors.grey,
              loop: 2,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 50.h,
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
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        height: 68.h,
                        width: 165.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        height: 68.h,
                        width: 165.w,
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
                    height: 110.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60.h,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      color: MyColors.primaryGreen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
