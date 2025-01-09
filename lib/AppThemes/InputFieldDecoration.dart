import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
class InputFieldDecoration{
  static final OutlineInputBorder border_decoration = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primarycolor, width: 1),
      borderRadius: BorderRadius.circular(16));
}