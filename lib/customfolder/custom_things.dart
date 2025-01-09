import 'package:flutter/material.dart';
class customstheam{
  late final double height;
  late final double width;
  //text heading
  static const double h1= 15;
  static const Color h1_color = Colors.black;
  static const h1_weight= FontWeight.w500;
//icons
  static const double icon_size = 35;
  static Color icon_col=Color(0xFF01B393);

  //Finance dashbord
  static Color bgfinance=Color(0xFFFFF2DF);
  static Color line_col=Color(0xFFE3DAD3);
  static double text_responsive=14;
  static double text_responsive16=16;
  static double text_heading=18;
  static double icon_s=24;



  customstheam(BuildContext context){
    this.height = MediaQuery.sizeOf(context).height;
    this.width = MediaQuery.sizeOf(context).width;

    text_responsive = width*0.035;
    text_responsive16= width*0.04;
    text_heading = width*0.045;
    icon_s=width*0.06;



  }

}
