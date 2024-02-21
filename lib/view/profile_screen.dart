import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/strings.dart';

import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../Widget/profile_screen_widgets/card.dart';
import '../animation/scaletransition_animation.dart';
import 'navibar_items/profile/account_info.dart';
import 'navibar_items/profile/faqs.dart';
import 'navibar_items/profile/general_setting.dart';
import 'navibar_items/profile/notifications.dart';
import 'navibar_items/profile/select_language.dart';
import 'navibar_items/profile/verification.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  final Tween<Offset> _offset =
      Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
  AnimationController? _controller;
  final GlobalKey<AnimatedListState> _listkey = GlobalKey<AnimatedListState>();
  bool accountVerified = false;

  List<Widget> newList = [];

  void addData() {
    Future ft = Future(() {});
    reUsableList.forEach((var resList) {
      ft = ft.then((value) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          newList.add(
            CardWidget(
              imagepath: resList['svgImage'],
              title: resList['title'.tr],
              onpress: resList['onPressed'],
            ),
          );
          _listkey.currentState?.insertItem(newList.length - 1);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addData();
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _controller!.dispose();
  }

  List<Map<String, dynamic>> reUsableList = [
    {
      'title': Strings.accountInfo.tr,
      'onPressed': () {
        Get.to(AccountInfo());
      },
      'svgImage': MyImgs.accountInfo
    },
    {
      'title': Strings.language.tr,
      'onPressed': () {
        Get.to(Language());
      },
      'svgImage': MyImgs.language
    },
    {
      'title': Strings.generalSetting.tr,
      'onPressed': () {
        Get.to(Setting());
      },
      'svgImage': MyImgs.generalSetting
    },
    {
      'title': Strings.faqs.tr,
      'onPressed': () {
        Get.to(Faqs());
      },
      'svgImage': MyImgs.faqs,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80.h,
        scrolledUnderElevation: 0,
        title: TextStyleWidget(
          title: Strings.profileSettings.tr,
          size: 16.sp,
          weight: FontWeight.w700,
          color: MyColors.black,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(Notifications());
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 0.1.w,
                    color: MyColors.white20,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Badge(
                child: Icon(
                  Icons.notifications_none_outlined,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: MyColors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.sp),
                decoration: const BoxDecoration(
                  color: MyColors.lightRed,
                ),
                child: Row(
                  children: [
                    TextStyleWidget(
                      title: Strings.verifyMsge.tr,
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: MyColors.red,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(Verification());
                      },
                      child: Row(
                        children: [
                          TextStyleWidget(
                            title: Strings.verify.tr,
                            size: 12.sp,
                            weight: FontWeight.w600,
                            color: MyColors.red,
                          ),
                          SvgPicture.asset(MyImgs.arrowForward),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Container(
                  width: 346.w,
                  height: 159.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x0F103972),
                        blurRadius: 99.r,
                        offset: Offset(0, 20),
                        spreadRadius: 7.r,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ScalesTransitionAnimation(
                        child: Center(
                          child: FadeInImage(
                            placeholder: AssetImage(''),
                            image: AssetImage(MyImgs.profileAvatar),
                            width: 100.w,
                            height: 100,
                          ),
                        ),
                      ),
                      ScalesTransitionAnimation(
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                baseColor: MyColors.blueEsh,
                                highlightColor: MyColors.yellow,
                                loop: 3,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextStyleWidget(
                                      title: Strings.userName.tr,
                                      size: 16.sp,
                                      weight: FontWeight.w700,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              SvgPicture.asset(MyImgs.verifyBadge),
                            ],
                          ),
                        ),
                      ),
                      ScalesTransitionAnimation(
                        child: Center(
                          child: TextStyleWidget(
                            title: Strings.email.tr,
                            size: 12.sp,
                            weight: FontWeight.w400,
                            color: MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  width: 346.w,
                  height: 265.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  child: Center(
                    child: AnimatedList(
                      key: _listkey,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index, Animation<double> Animation) {
                        return SlideTransition(
                          position: Animation.drive(_offset),
                          child: newList[index],
                        );
                      },
                      initialItemCount: newList.length,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
                width: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
