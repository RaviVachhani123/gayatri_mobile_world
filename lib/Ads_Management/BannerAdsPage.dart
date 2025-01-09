import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../AppThemes/AppColors.dart';
import '../NavigationAnimation/Navigation_Animation.dart';
import '../customfolder/custom_things.dart';
class BannerAdsPage extends StatefulWidget {
  const BannerAdsPage({super.key});

  @override
  State<BannerAdsPage> createState() => _BannerAdsPageState();
}

class _BannerAdsPageState extends State<BannerAdsPage> {
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
        title: Text('Banner Ads',style: TextStyle(fontSize:customstheam.text_heading),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      floatingActionButton:ElevatedButton(
        onPressed: () {
          if(mounted){
            Navigator.push(context, NavigationAnimation.NavigatorAnimationPush(Upload()));
          }
        },
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width*0.95, height*0.045),
          backgroundColor: customstheam.icon_col,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      child: Text(
        'Add New Banner',
        style: TextStyle(color: Colors.white, fontSize:customstheam.text_responsive),
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}



class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  XFile? image;

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
        title: Text('Banner Ads',style: TextStyle(fontSize:customstheam.text_heading),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: height*0.02,),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  useSafeArea: true,
                  isScrollControlled: true,
                  context: context, builder: (context) {
                  return
                    Container(
                      height: height*0.075,
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: ()async{
                              final pic=await ImagePicker().pickImage(source: ImageSource.gallery);
                              if (pic!=null){
                                image = pic;
                                setState(() {
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.01),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.photo,color: customstheam.icon_col,size: customstheam.icon_s,),
                                  SizedBox(width: 10,),
                                  Text("Gallery",style: TextStyle(fontSize:customstheam.text_responsive16),)
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: ()async{
                              final pic=await ImagePicker().pickImage(source: ImageSource.camera);
                              if (pic!=null){
                                image = pic;
                                setState(() {
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.01),
                              child: Row(
                                children: [
                                  Icon(Icons.camera,color: customstheam.icon_col,size: customstheam.icon_s,),
                                  SizedBox(width: 10,),
                                  Text("Camera",style: TextStyle(fontSize: customstheam.text_responsive16),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                },
                );
              },
              child: image==null?Container(
                height: height*0.14,
                width: width*0.9,
                decoration: BoxDecoration(
                  border: Border.all(color:customstheam.icon_col),
                  borderRadius: BorderRadius.circular(10),
                  color:customstheam.icon_col.withOpacity(0.1),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: width*0.06,),
                      Text("Upload Banner Image (16:9)",style: TextStyle(fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
              ):Container(
                child: Image.file(
                  File(image!.path),fit:BoxFit.cover,
                  height: height*0.14,
                  width: width*0.9,
                ),
              ),
            ),
          ],
        ),
      ),


      floatingActionButton:ElevatedButton(
        onPressed: () {
          // if(mounted){
          //   Navigator.push(context, NavigationAnimation.NavigatorAnimationPush(Upload()));
          // }
        },
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
