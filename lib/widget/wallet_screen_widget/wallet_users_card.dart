import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';

class WalletUsers extends StatefulWidget {
  String imagepath, userName, date;
  String amount, balance;

  WalletUsers({Key? key,
    required this.imagepath,
    required this.userName,
    required this.amount,
    required this.date,
    required this.balance,}) : super(key: key);

  @override
  State<WalletUsers> createState() => _WalletUsersState();
}

class _WalletUsersState extends State<WalletUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0), // Set the radius here
                child: Image.asset(
                  widget.imagepath, // Replace with your image URL
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: widget.userName, size: 14.sp,color: MyColors.blueEsh,weight: FontWeight.w700,),
                          TextStyleWidget(title: widget.amount, size: 14.sp,color:  MyColors.red,weight: FontWeight.w700,),
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleWidget(title: 'Balance \$ ${widget.balance}', size: 12.sp,color: MyColors.lightGrey,weight: FontWeight.w500,),
                          TextStyleWidget(title: widget.date, size: 12.sp,color: MyColors.lightGrey,weight: FontWeight.w500,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(color: MyColors.white30),
        ],
      ),
    );
  }
}
