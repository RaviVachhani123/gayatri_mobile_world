import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: customstheam.icon_col,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Contact Us',style: TextStyle(fontSize: 18),),
        centerTitle: true,
        // backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body:Padding(
        padding: const EdgeInsets.only(right: 20,left: 20,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 20),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 160,
              ),
            ),

            Text(
              'Our Contact Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: width*0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),

              ),
              child: Text(
                'info.gayatrimobile@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: width*0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '9978447878 / 9925157510  9978447878',
                style: TextStyle(fontSize: 16),
                // textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         crossAxisAlignment:   CrossAxisAlignment.center,
    //         children: [
    //           Container(
    //             color: Colors.red,
    //             child: Row(
    //               children: [
    //                 IconButton(
    //                   onPressed: (){
    //                     Navigator.pop(context);
    //                   },
    //                   icon: Icon(Icons.arrow_back,color: Colors.black),
    //                 ),
    //                 Align(
    //                     alignment:Alignment.center ,child: Text("Contact Us"))
    //
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     )
    //   ),
    // );
  }
}
