import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import '../AppThemes/TextThemes.dart';
import '../customfolder/custom_things.dart';

class FeaturedProductAdPage extends StatefulWidget {
  const FeaturedProductAdPage({super.key});

  @override
  State<FeaturedProductAdPage> createState() => _FeaturedProductAdPageState();
}

class _FeaturedProductAdPageState extends State<FeaturedProductAdPage> {

  String? groupValue;


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.bgcolor,
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: AppColors.bgcolor,
        backgroundColor: AppColors.bgcolor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col,size:customstheam.icon_s,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Featured Products',style: TextStyle(fontSize:customstheam.text_heading),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),

              // Select Product
              Text("Select Product",
                style: TextStyle(fontSize: customstheam.text_responsive,),),
              SizedBox(height: height * 0.009),
        
              //Select Product dropwown
              Container(
                alignment: Alignment.center,
                height: height * 0.050,
                width: width * 2,
                decoration: BoxDecoration(
                  color: customstheam.icon_col,
                  border: Border.all(
                    color: customstheam.icon_col,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Product',
                        style: TextStyle(
                            fontSize: customstheam.text_responsive,
                            color: Colors.white,
                            fontWeight: customstheam.h1_weight),
                      ),
                      Icon(
                        Icons.arrow_downward, size: customstheam.text_responsive,
                        color: Colors.white,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.009,),
        
              //Choose Ads Options
              Text("Choose Ads Options",
                style: TextStyle(fontSize: customstheam.text_responsive,),),
              SizedBox(height: height * 0.009),
        
              //radio button
              Container(
                alignment: Alignment.center,
                height: height * 0.050,
                width: width * 2,
                decoration: BoxDecoration(
                  color: customstheam.icon_col.withOpacity(0.1),
                  border: Border.all(
                    color: customstheam.icon_col,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
        
                      Row(
                        children: [
                          Radio<String>(
                            value: 'click1',
                            groupValue: groupValue,
                            onChanged: (value) {
                              setState(() {
                                groupValue = value; // Update the selected value
                              });
                            },
                          ),
        
                          SizedBox(width: width * 0.04,),
        
                          Text('For 10 Days',
                            style: TextStyle(
                              fontSize: customstheam.text_responsive,
                            ),
                          ),
                        ],
                      ),
        
                      Row(
                        children: [
                          Icon(Icons.currency_rupee, color: customstheam.icon_col,
                            size: customstheam.text_responsive,),
                          Text("50.0", style: TextStyle(fontSize: customstheam
                              .text_responsive, fontWeight: customstheam
                              .h1_weight, color: customstheam.icon_col),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),

        
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width*0.95, height*0.045),
          backgroundColor: customstheam.icon_col,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Continue',
          style: TextStyle(color: Colors.white, fontSize:customstheam.text_responsive),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

