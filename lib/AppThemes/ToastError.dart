import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/TextThemes.dart';
// import 'package:gayatrimobileworld/AppThemes/AppColors.dart';
// import 'package:gayatrimobileworld/AppThemes/TextThemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastError{
  static errorNotification(context , text){
    toastification.show(
      context:  context,
      type: ToastificationType.warning,
      style: ToastificationStyle.simple,
      title: CustomizedText(text: "$text", size: TextSizes.Title_1, weight: TextSizes.normal_text),
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
// static errorNotification(context , text){
//   return Fluttertoast.showToast(
//     msg: text,
//     gravity: ToastGravity.BOTTOM,
//     fontSize: TextSizes.Title_1,
//     timeInSecForIosWeb: 3,
//
//   );
// }

// static errorNotification(BuildContext context, String text) {
//   FToast fToast = FToast();
//   fToast.init(context);
//   final double width = MediaQuery.of(context).size.width;
//   Widget toast = Container(
//     padding: EdgeInsets.symmetric(horizontal: width*0.04),
//     decoration: BoxDecoration(
//       color: AppColors.textcolor.withOpacity(0.05),
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: CustomizedText(text: text, size: TextSizes.Title_1, weight: TextSizes.Semi_Bold_text,color:AppColors.textcolor,)
//   );
//
//   fToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: Duration(seconds: 3),
//   );
// }
}