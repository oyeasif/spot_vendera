import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/widget/navibar.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String selectedLanguage = 'en';

  bool english = false;
  bool arabic = false;

  final List flags = [MyImgs.engFlag, MyImgs.arabicFlag];

  final List locale = [
    {
      "name": Strings.english.tr,
      'locale': const Locale('en', 'US'),
    },
    {
      "name": Strings.arabic.tr,
      'locale': const Locale('ar', 'SA'),
    }
  ];

  updatelang(Locale locale) {
    Get.to(NaviBarWidget(currentindex: 3));
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: GestureDetector(
                onTap: () {
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
                        border: Border.all(
                            strokeAlign: 0.1,
                            width: 0.7.sp,
                            color: MyColors.blueEsh10),
                      ),
                    ),
                    SvgPicture.asset(MyImgs.backIcon),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            TextStyleWidget(
              title: Strings.selectLanguage.tr,
              size: 14.sp,
              color: MyColors.blueEsh10,
              weight: FontWeight.w700,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                int selected = 0;
                return ListTile(
                  onTap: () {
                    setState(() {
                      selected = index;
                      updatelang(locale[index]['locale']);
                    });
                  },
                  leading: Image(
                    image: AssetImage(flags[index]),
                    height: 18.h,
                    width: 18.h,
                  ),
                  title: TextStyleWidget(
                    title: locale[index]['name'.tr],
                    size: 16.sp,
                    weight: FontWeight.w600,
                    color: MyColors.black30,
                  ),
                  trailing: Container(
                    width: 20.0.w,
                    height: 20.0.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected == index
                          ? MyColors.primaryGreen
                          : Colors.white,
                      border: Border.all(
                        color: english ? MyColors.primaryGreen : Colors.grey,
                        width: 1.0.w,
                      ),
                    ),
                    child: selected == index
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 15.0.sp,
                            ),
                          )
                        : null,
                  ),
                );
              },
              itemCount: locale.length,
            ),
          ],
        ),
      ),
    );
  }
}
