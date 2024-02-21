import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/color.dart';
import '../text_widget.dart';

class UnselectContainer extends StatelessWidget {

  final String orders, title;
  final VoidCallback onPress;
  const UnselectContainer({Key? key, required this.orders, required this.title, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.sp),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(10.sp),
          decoration: ShapeDecoration(
            color: MyColors.lightGrey20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleWidget(title: orders, size: 16,weight: FontWeight.w700,),
              TextStyleWidget(title: title, size: 10,weight: FontWeight.w400,),

            ],
          ),
        ),
      ),
    );
  }
}
