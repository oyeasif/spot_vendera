
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/res/my_imgs.dart';
import '../Widget/orders_screen_widget/select_container.dart';
import '../Widget/orders_screen_widget/unselect_container.dart';
import '../Widget/text_widget.dart';
import '../res/color.dart';
import '../res/strings.dart';
import 'navibar_items/orders/all_orders.dart';
import 'navibar_items/orders/delivered_orders.dart';
import 'navibar_items/orders/failed_orders.dart';
import 'navibar_items/orders/on_the_way_orders.dart';
import 'navibar_items/orders/placed_orders.dart';

class OrdersScreen extends StatefulWidget {

  OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextStyleWidget(
                      title: Strings.orderHistory.tr,
                      size: 14.sp,
                      color: MyColors.blueEsh10,
                      weight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        Container(
                        width: 93.w,
                        height: 30.h,
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextStyleWidget(
                              title: Strings.month.tr,
                              size: 11.sp,
                              color: MyColors.black,
                              weight: FontWeight.w400,
                            ),
                            const SizedBox(width: 3),
                            SvgPicture.asset(MyImgs.arrowDown2),
                          ],
                        ),
                      ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0.sp),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: Center(child: SvgPicture.asset(MyImgs.searchIcon)),
                      ),
                      hintText: Strings.search.tr,
                      fillColor: MyColors.textFieldColor,
                      filled: true,
                      hintStyle: TextStyle(
                        color: MyColors.searchText,
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 0.09.h,
                        letterSpacing: 0.30,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.r),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                child: Row(
                  children: [
                    isSelected == 0
                        ? Expanded(
                            child: SelectContainer(
                            orders: '25',
                            title: Strings.allOrders.tr,
                            onPress: () {
                              setState(() {
                                print('object');
                                isSelected = 0;
                              });
                            },
                          ))
                        : Expanded(
                            child: UnselectContainer(
                            orders: '25',
                              title: Strings.allOrders.tr,
                            onPress: () {
                              setState(() {
                                print('object');
                                isSelected = 0;
                              });
                            },
                          )),
                    isSelected == 1 ? Expanded(
                        child: SelectContainer(
                      orders: '02',
                      title: Strings.placedOrders.tr,
                      onPress: () {
                        setState(() {
                          print('object');
                          isSelected = 1;
                        });
                      },
                    ))
                        :
                    Expanded(
                        child: UnselectContainer(
                          orders: '02',
                          title: Strings.placedOrders.tr,
                          onPress: () {
                            setState(() {
                              print('object');
                              isSelected = 1;
                            });
                          },
                        )),
                    isSelected == 2 ?
                    SelectContainer(
                      orders: '05',
                      title: Strings.deliveredOrders.tr,
                      onPress: () {
                        setState(() {
                          print('object');
                          isSelected = 2;
                        });
                      },
                    ) :
                    UnselectContainer(
                      orders: '05',
                      title: Strings.deliveredOrders.tr,
                      onPress: () {
                        setState(() {
                          print('object');
                          isSelected = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
                child: Row(
                  children: [
                    isSelected == 3 ? SelectContainer(
                        orders: '03',
                        title: Strings.cancelledOrder.tr,
                        onPress: () {
                          setState(() {
                            print('object');
                            isSelected = 3;
                          });
                        }) :
                    UnselectContainer(
                        orders: '03',
                        title: Strings.cancelledOrder.tr,
                        onPress: () {
                          setState(() {
                            print('object');
                            isSelected = 3;
                          });
                        }),
                    isSelected == 4 ?
                    Expanded(
                        child: SelectContainer(
                            orders: '02',
                            title: Strings.onTheWayOrders.tr,
                            onPress: () {
                              setState(() {
                                print('object');
                                isSelected = 4;
                              });
                            })) :
                    Expanded(
                        child: UnselectContainer(
                            orders: '02',
                            title: Strings.onTheWayOrders.tr,
                            onPress: () {
                              setState(() {
                                print('object');
                                isSelected = 4;
                              });
                            })),
                  ],
                ),
              ),
              if(isSelected == 0) AllOrders(),
              if(isSelected == 1) PlacedOrders(),
              if(isSelected == 2) DeliveredOrders(),
              if(isSelected == 3) FailedOrders(),
              if(isSelected == 4) OnTheWayOrder(),


            ],
          ),
        ),
      ),
    );
  }
}
