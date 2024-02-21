import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/res/color.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';


class AddMoney extends StatefulWidget {
  const AddMoney({Key? key}) : super(key: key);

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {


  int isSelectedList = 0;
  List<int> priceList=[5,10,15,20,50,100,200,500];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.h,
        scrolledUnderElevation: 0,
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
            TextStyleWidget(title: Strings.addMoney.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  GridView.builder(
                    shrinkWrap: true,

                    itemCount: priceList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5.0.sp),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelectedList = index;
                            log(priceList[index].toString());
                          });
                        },
                        child: Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            color: isSelectedList == index
                                ? MyColors.primaryGreen
                                : MyColors.textFieldColor,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Center(
                            child: TextStyleWidget(
                              title: '\$ ${priceList[index].toString()}'.tr,
                              size: 16.sp,
                              color: isSelectedList == index ? Colors.white : MyColors.blueEsh10,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: SvgPicture.asset(MyImgs.minus),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 60.h,
                          child: Center(
                            child: TextFormField(
                              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w700, color: MyColors.blueEsh10,),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(MyImgs.plus),
                      ),
                    ],
                  ),
                  Slider(
                    value: 0.5, onChanged: (value){}, activeColor: MyColors.primaryGreen,),
                ],
              ),
            ),
            ButtonWidget(
              title: Strings.addMoney.tr,
              onPress: (){},
              buttonColor: MyColors.primaryGreen,
              textColor: MyColors.white,
              borderSideColor: MyColors.primaryGreen,
            ),
          ],
        ),
      ),
    );
  }
}
