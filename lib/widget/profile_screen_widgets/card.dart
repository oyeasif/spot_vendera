

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';

class CardWidget extends StatelessWidget {
  VoidCallback onpress = (){};
  final String imagepath;
  final String title;
  CardWidget({Key? key, required this.imagepath, required this.title, required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        tileColor: MyColors.white,
        onTap: onpress,
        leading: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: MyColors.textFieldColor
            ),
          child: Center(
            child: SvgPicture.asset(imagepath),
          ),
           ),
        title: Shimmer.fromColors(baseColor: MyColors.blueEsh,loop: 3,highlightColor: MyColors.yellow,child: TextStyleWidget(title: title, size: 14.sp,color: MyColors.blueEsh,weight: FontWeight.w600,)),
        trailing: Icon(Icons.chevron_right, color: MyColors.lightGrey,size: 20.sp),
      ),
    );
  }
}
