import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../customfolder/custom_things.dart';
class UnlockPhoneData extends StatefulWidget {
  const UnlockPhoneData({super.key});

  @override
  State<UnlockPhoneData> createState() => _UnlockPhoneDataState();
}

class _UnlockPhoneDataState extends State<UnlockPhoneData> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Unlock Phone Data',style: TextStyle(fontSize:18),),
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Lottie.asset('assets/images/Emptybox.json',height: height*0.33),
            ),

            Container(
              width: width*0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 1.0,         // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Reload',style: TextStyle(color: Colors.deepPurple),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
