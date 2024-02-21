import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/color.dart';
import '../text_widget.dart';

class ColumnWidget extends StatefulWidget {

  String title, icon, subtitle;
  final arrowIcon,arrowIconColor;

  ColumnWidget({Key? key, required this.title, required this.icon, required this.subtitle, this.arrowIcon, this.arrowIconColor}) : super(key: key);

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(widget.icon),
        TextStyleWidget(title: widget.title, size: 12.sp,weight: FontWeight.w400,color: MyColors.lightGrey30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextStyleWidget(title: widget.subtitle, size: 16.sp,weight: FontWeight.w700,color: MyColors.primaryGreen,),
            SizedBox(width: 30.w,),
            SvgPicture.asset(widget.arrowIcon,color: widget.arrowIconColor,)
          ],
        ),
      ],
    );
  }
}
