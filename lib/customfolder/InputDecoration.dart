import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
class CustomInputDecoration {
  static OutlineInputBorder CustomDeco(context)=>OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: customstheam.icon_col,width: MediaQuery.sizeOf(context).width*0.0025),

  );
}
