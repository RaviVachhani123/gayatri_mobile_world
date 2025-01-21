
import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
// import 'package:gayatrimobileworld/AppThemes/AppColors.dart';
// import 'package:gayatrimobileworld/customfolder/custom_things.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        toolbarHeight: width * 0.15,
        backgroundColor: AppColors.bgcolor,
        surfaceTintColor: AppColors.bgcolor,
        title: Text("Add cellphone details",style: TextStyle(fontSize: customstheam.text_responsive18,fontWeight: FontWeight.w400),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(
          color: customstheam.icon_col,
          size: width * 0.06,
        ),
      ),
      body:Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                // 'Assets/Logo/Gayatri_main.jpg',
                'assets/images/Gayatri_main.jpg',
                width: width*0.3,
                // height: 80,
                // width: 160,
              ),
            ),

            Text(
              'Our Contact Details',
              style: TextStyle(
                fontSize: customstheam.text_responsive16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: height*0.015),
            Container(
              width: width*0.9,
              padding: EdgeInsets.symmetric(vertical: height*0.015,horizontal: width*0.025),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),

              ),
              child: Text(
                'info.gayatrimobile@gmail.com',
                style: TextStyle(fontSize: customstheam.text_responsive),
              ),
            ),
            SizedBox(height: height*0.0095),
            Container(
              width: width*0.9,
              padding: EdgeInsets.symmetric(vertical: height*0.015,horizontal: width*0.025),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '9978447878 / 9925157510 / 9978447878',
                style: TextStyle(fontSize: customstheam.text_responsive),
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
//
// class ContactUs extends StatelessWidget {
//   const ContactUs({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.sizeOf(context).width;
//     final double height = MediaQuery.sizeOf(context).height;
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back,color: customstheam.icon_col,),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text('Contact Us',style: TextStyle(fontSize: 18),),
//         centerTitle: true,
//         // backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body:Padding(
//         padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // SizedBox(height: 20),
//             Center(
//               child: Image.asset(
//                 'assets/images/logo.png',
//                 height: 80,
//                 width: 160,
//               ),
//             ),
//
//             Text(
//               'Our Contact Details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 15),
//             Container(
//               width: width*0.9,
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//
//               ),
//               child: Text(
//                 'info.gayatrimobile@gmail.com',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             SizedBox(height: 10),
//             Container(
//               width: width*0.9,
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 '9978447878 / 9925157510  9978447878',
//                 style: TextStyle(fontSize: 16),
//                 // textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
