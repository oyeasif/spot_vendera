import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/my_imgs.dart';
import 'package:spotappui/view/authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity, // Full width
            height: double.infinity, // Full height
            child: Image(
              image: AssetImage(MyImgs.splashScreen),
              fit: BoxFit.fill,
            ),
          ),
          Shimmer.fromColors(
            baseColor: MyColors.white,
            highlightColor: MyColors.primaryGreen,
            period: Duration(
              milliseconds: 2000,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(MyImgs.logo),
                  SizedBox(height: 40.h,),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Spot',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 0.05,
                          ),
                        ),
                        TextSpan(
                          text: 'Delivery ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6299999952316284),
                            fontSize: 32.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 0.05,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
