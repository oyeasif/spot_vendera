import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/res/color.dart';

import '../../../Widget/profile_screen_widgets/list_view_items.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  bool isShimmer = true;

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
    return Scaffold(
      appBar: AppBar(
        toolbarOpacity: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: GestureDetector(
                onTap: (){
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
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(strokeAlign: 0.1,width: 0.7.sp,color: MyColors.blueEsh10),
                      ),
                    ),
                    SvgPicture.asset(MyImgs.backIcon),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            TextStyleWidget(title: Strings.notification.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: isShimmer
            ? Shimmer.fromColors(
          baseColor: Colors.white,
              highlightColor: Colors.grey,
              child: ListView.builder(
              itemCount: 10,
              itemBuilder: (BuildContext context, index){
                return Padding(
                  padding: EdgeInsets.all(5.sp),
                  child: Container(
                    color: Colors.white,
                    width: 327.w,
                    height: 56.h,
                  ),
                );
              }
                      ),
            )
            : ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, index){
              return ListViewItemWidget(
                title: Strings.moneyTransfer.tr,
                time: Strings.orderTime,
                subtitle: Strings.sentMoney.tr,
              );
            }
        )
        ,
      ),
    );
  }
}
