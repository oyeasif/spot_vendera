import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';

import '../../res/my_imgs.dart';

class ListViewItemWidget extends StatefulWidget {

  final String title, time, subtitle;
  const ListViewItemWidget({Key? key, required this.title, required this.time, required this.subtitle}) : super(key: key);

  @override
  State<ListViewItemWidget> createState() => _ListViewItemWidgetState();
}

class _ListViewItemWidgetState extends State<ListViewItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: Container(
            decoration: BoxDecoration(
                color: MyColors.textFieldColor,
                borderRadius: BorderRadius.circular(12.r)
            ),
            height: 48.h,
            width: 48.w,
            child: Center(child: SvgPicture.asset(MyImgs.moneySend)),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextStyleWidget(title: widget.title, size: 16.sp,weight: FontWeight.w700,color: MyColors.blueEsh,),
                      TextStyleWidget(title: widget.time, size: 12.sp,color: MyColors.lightGrey,weight: FontWeight.w400,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0.w, bottom: 8.0.h),
                child: TextStyleWidget(title: widget.subtitle, size: 12.sp,color: MyColors.lightGrey,weight: FontWeight.w400,),
              )
            ],
          ),
        ),

      ],
    );
  }
}
