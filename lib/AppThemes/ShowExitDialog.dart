import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:gayatri_mobile_world/AppThemes/TextThemes.dart';

class ShowExitDialog{
  static ShowDialog(context){
    final double width = MediaQuery.sizeOf(context).width;
    final double height= MediaQuery.sizeOf(context).height;
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        content: CustomizedText(text: "Are you sure you want to exit?", size: TextSizes.Heading_2, weight: TextSizes.normal_text , textAlign: TextAlign.center,),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                fixedSize: Size(width*0.25, height*0.025),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: AppColors.primarycolor,
                  ),
                ),
              ),
            onPressed: () => Navigator.of(context).pop(false), // Stay in app
            child: CustomizedText(text: "Cancel", size: TextSizes.Heading_2, weight: TextSizes.normal_text,color: AppColors.primarycolor,)
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primarycolor,
              fixedSize: Size(width*0.25, height*0.025),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: AppColors.primarycolor,
                ),
              ),
            ),
            onPressed: () => SystemNavigator.pop(),
              child: CustomizedText(text: "Exit", size: TextSizes.Heading_2, weight: TextSizes.normal_text,color: AppColors.bgcolor,)
          ),
        ],
      );
    });
  }
}
