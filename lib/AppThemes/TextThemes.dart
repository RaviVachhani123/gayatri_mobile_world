import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSizes{
  late final double height;
  late final double width;
  static double Heading_1=16;
  static double Heading_2=14;
  static double Title_1 = 12;
  TextSizes(BuildContext context){
    this.height = MediaQuery.sizeOf(context).height;
    this.width = MediaQuery.sizeOf(context).width;
    Heading_1 = width*0.04;
    Heading_2 = width*0.035;
    Title_1 = width*0.03;
  }

  static FontWeight normal_text = FontWeight.normal;
  static FontWeight Medium_text = FontWeight.w500;
  static FontWeight Semi_Bold_text = FontWeight.w600;
  static FontWeight Bold_text = FontWeight.w700;
}

class CustomizedText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  const CustomizedText({required this.text,required this.size, required this.weight,this.color = AppColors.textcolor,this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.rubik(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
      textAlign: textAlign,
    );
  }
}
