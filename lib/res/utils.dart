import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';

class Utilss {
  static bool emailValidator(String email) {
// Utils.emailValidator if emaill is wrong return false
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static void formatCNIC(TextEditingController controller) {
    String text = controller.text;
    String formattedText = '';
    String numericText = text.replaceAll(RegExp(r'[^0-9]'), '');
    if (numericText.length > 5) {
      formattedText += numericText.substring(0, 5) + '-';
      if (numericText.length > 12) {
        formattedText += numericText.substring(5, 12) + '-';
        if (numericText.length > 13) {
          formattedText += numericText.substring(12, 13);
        } else {
          formattedText += numericText.substring(12);
        }
      } else {
        formattedText += numericText.substring(5);
      }
    } else {
      formattedText += numericText;
    }
    if (formattedText != text) {
      controller.value = controller.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

 static void getSnackBar(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(16),
      backgroundColor: MyColors.primaryGreen,
      colorText: Colors.white,
    );
  }

  static void snackBarMaterial(String msg,BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(msg)),
    );
  }
}
