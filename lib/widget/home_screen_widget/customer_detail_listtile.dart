import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/color.dart';
import '../../res/my_imgs.dart';
import '../text_widget.dart';

class CustomerListTile extends StatefulWidget {

  String leading, title, trailing;

  CustomerListTile({Key? key, required this.leading, required this.title, required this.trailing}) : super(key: key);

  @override
  State<CustomerListTile> createState() => _CustomerListTileState();
}

class _CustomerListTileState extends State<CustomerListTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(widget.leading,color: MyColors.primaryGreen,),
            SizedBox(width: 10.w,),
            TextStyleWidget(title: widget.title, size: 12.sp,weight: FontWeight.w400,color: MyColors.black20,),
          ],
        ),
        TextStyleWidget(title: widget.trailing, size: 12.sp,weight: FontWeight.w400,color: MyColors.primaryGreen,),
      ],
    );
  }
}
