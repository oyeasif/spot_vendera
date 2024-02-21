import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotappui/res/color.dart';

import '../text_widget.dart';
class CheckBoxWithTitleWidget extends StatefulWidget {

  final String title;
  bool pickup;
  CheckBoxWithTitleWidget({Key? key, required this.title, required this.pickup}) : super(key: key);

  @override
  State<CheckBoxWithTitleWidget> createState() => _CheckBoxWithTitleWidgetState();
}

class _CheckBoxWithTitleWidgetState extends State<CheckBoxWithTitleWidget> {




  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              widget.pickup = !widget.pickup;
            });
          },
          child: Container(
            width: 20.0.w,
            height: 20.0.h,
            decoration: BoxDecoration(
              color: widget.pickup ? MyColors.primaryGreen : Colors.white,
              border: Border.all(
                color: widget.pickup ? MyColors.primaryGreen : Colors.grey,
                width: 1.0.w,
              ),
            ),
            child: widget.pickup
                ? Center(
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 15.0.sp,
              ),
            )
                : null,
          ),
        ),
        SizedBox(width: 10.w,),
        TextStyleWidget(title: widget.title, size: 12,weight: FontWeight.w500,),
      ],
    );
  }
}
