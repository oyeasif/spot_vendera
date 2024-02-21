import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/Widget/text_widget.dart';
import 'package:spotappui/res/color.dart';
import 'package:spotappui/res/strings.dart';
import 'package:spotappui/view/navibar_items/profile/verification.dart';

import '../../../res/my_imgs.dart';
import 'edit_account.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {

  final DatabaseReference _database = FirebaseDatabase.instance.ref('data');

  showToast() {
    print('Toast Called');
    Fluttertoast.showToast(
      msg: 'No save data',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0.sp,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                onTap: (){
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
                        border: Border.all(strokeAlign: 0.1,width: 0.7.sp,color: MyColors.blueEsh10),
                      ),
                    ),
                    SvgPicture.asset(MyImgs.backIcon),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w,),
            TextStyleWidget(title: Strings.accountInfo.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0.sp),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 64.r,
                            backgroundImage: AssetImage(MyImgs.profileAvatar),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Align(
                      alignment: Alignment.topLeft,
                        child: TextStyleWidget(title: Strings.companyInfo.tr, size: 16.sp,weight: FontWeight.w700,color: MyColors.lightGrey,)),
                    SizedBox(height: 18.h,),
                    Container(
                      padding: EdgeInsets.all(16.0.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(strokeAlign: 0.2,width: 0.2.sp,color: MyColors.lightGrey10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleWidget(title: Strings.companyName.tr, size: 14.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                              TextStyleWidget(title: Strings.company.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleWidget(title: Strings.phoneLabel.tr, size: 14.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                              TextStyleWidget(title: Strings.phone.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleWidget(title: Strings.civilIDLabel.tr, size: 14.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                              TextStyleWidget(title: Strings.civilId.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,),
                            ],
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyleWidget(title: Strings.IBANLabel.tr, size: 14.sp,weight: FontWeight.w500,color: MyColors.lightGrey,),
                              SizedBox(width: 35.w,),
                              Expanded(child: TextStyleWidget(title: Strings.IBANno.tr, size: 14.sp,weight: FontWeight.w600,color: MyColors.blueEsh,)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                title: Strings.edit.tr,
                onPress: (){
                  Get.to(Verification());
                },
                buttonColor: MyColors.white10,
                textColor: MyColors.buttonTextColor,
                borderSideColor: MyColors.white10,
              ),
            ],
          ),
        ),
      ),
    );
  }


  _showDialog() {
    Future.delayed(Duration.zero,(){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          User? currentUser = FirebaseAuth.instance.currentUser;


          return FirebaseAnimatedList(
            query: _database,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

              Map data = snapshot.value as Map;
              data[currentUser?.uid ?? ''] = snapshot.key;

              return Center(
                child: AlertDialog(
                  title: Column(
                    children: [
                      Text(Strings.name.tr + ': ${data['name']}'.tr,style: TextStyle(fontSize: 18.sp),),
                      Text(Strings.emailLabel.tr + ': ${data['email']}.'.tr,style: TextStyle(fontSize: 18.sp),),
                      Text(Strings.phoneLabel.tr + ': ${data['phone']}'.tr,style: TextStyle(fontSize: 18.sp),),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text(Strings.ok.tr))
                  ],
                ),
              );
            },
          );
        },
      );
    });
  }

}
