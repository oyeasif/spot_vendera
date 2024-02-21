import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:spotappui/Widget/button_widget.dart';
import 'package:spotappui/res/color.dart';
import '../../../Widget/profile_screen_widgets/text_form_field.dart';
import '../../../Widget/text_widget.dart';
import '../../../res/my_imgs.dart';
import '../../../res/strings.dart';
import '../../../view_model/controller/controller.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({Key? key}) : super(key: key);

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {

  ServiceController controller = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 30.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(strokeAlign: 0.1,width: 0.7.w,color: MyColors.blueEsh10),
                  ),
                ),
                SvgPicture.asset(MyImgs.backIcon),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: TextStyleWidget(title: Strings.editAccount.tr, size: 14.sp,color: MyColors.blueEsh10,weight: FontWeight.w700,),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleWidget(title: Strings.nameLabel.tr, size: 16.sp,weight: FontWeight.w700,color: MyColors.lightGrey,),
              SizedBox(height: 10.h,),
              TextFieldWidget(controller: controller.nameController.value,hintText: Strings.userName.tr,),
              SizedBox(height: 20.h,),
              TextStyleWidget(title: Strings.emailLabel.tr, size: 16.sp,weight: FontWeight.w700,color: MyColors.lightGrey,),
              SizedBox(height: 10.h,),
              TextFieldWidget(controller: controller.emailController.value,hintText: Strings.email.tr,),
              SizedBox(height: 20.h,),
              TextStyleWidget(title: Strings.phoneLabel.tr, size: 16.sp,weight: FontWeight.w700,color: MyColors.lightGrey,),
              SizedBox(height: 10.h,),
              TextFieldWidget(controller: controller.phoneController.value,hintText: Strings.phone.tr,),
              Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWidget(
                        title: Strings.save.tr,
                        onPress: (){},
                        buttonColor: MyColors.primaryGreen,
                        textColor: MyColors.white,
                      borderSideColor: MyColors.primaryGreen,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
