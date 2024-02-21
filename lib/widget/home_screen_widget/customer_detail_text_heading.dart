import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/color.dart';
import '../text_widget.dart';

class TextHeading extends StatelessWidget {
  final String title;
  const TextHeading({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextStyleWidget(
      title: title,
      size: 14.sp,
      weight: FontWeight.w700,
      color: MyColors.black20,
    );
  }
}