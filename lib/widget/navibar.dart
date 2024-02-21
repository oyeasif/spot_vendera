import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/strings.dart';
import '../View/home_screen.dart';
import '../View/order_screen.dart';
import '../View/profile_screen.dart';
import '../View/wallet_screen.dart';
import '../animation/auto_shake_animation.dart';
import '../res/my_imgs.dart';

class NaviBarWidget extends StatefulWidget {

  int currentindex = 0;

  NaviBarWidget({Key? key,required this.currentindex}) : super(key: key);

  @override
  State<NaviBarWidget> createState() => _NaviBarWidgetState();
}

class _NaviBarWidgetState extends State<NaviBarWidget> {

  final List<Widget> _screens = [
    HomeScreen(),
    WalletScreen(),
    OrdersScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColors.white,
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(bottom: 60),
        child: _screens[widget.currentindex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0)
            .copyWith(left: 0, right: 0, bottom: 0),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: MyColors.white20,
              offset: const Offset(
                8.0,
                8.0,
              ),
              blurRadius: 4.0,
              spreadRadius: 4.0,
            )
          ]),
          child: BottomNavigationBar(
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: MyColors.primaryGreen,
            unselectedItemColor: MyColors.buttonTextColor,
            backgroundColor: MyColors.white,
            elevation: 0,
            iconSize: 24.sp,
            currentIndex: widget.currentindex,
            onTap: (value) {
              setState(() {
                widget.currentindex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: SvgPicture.asset(
                    MyImgs.naviHomeOutline,
                    color: MyColors.buttonTextColor,
                  ),
                ),
                label: Strings.home.tr,
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImgs.naviHome,
                      color: MyColors.primaryGreen,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImgs.naviWalletOutline,
                    color: MyColors.buttonTextColor,
                  ),
                ),
                label: Strings.wallet.tr,
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImgs.naviWallet,
                      color: MyColors.primaryGreen,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImgs.naviOrdersOutline,
                    color: MyColors.buttonTextColor,
                  ),
                ),
                label: Strings.orders.tr,
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImgs.naviOrders,
                      color: MyColors.primaryGreen,
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: SvgPicture.asset(
                    MyImgs.naviProfileOutline,
                    color: MyColors.buttonTextColor,
                  ),
                ),
                label: Strings.profile.tr,
                activeIcon: CustomShakeAnimation(
                  begin: '-5.0',
                  end: '5.0',
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: SvgPicture.asset(
                      MyImgs.naviProfile,
                      color: MyColors.primaryGreen,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

