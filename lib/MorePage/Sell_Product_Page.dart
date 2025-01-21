import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:gayatri_mobile_world/AppThemes/ToastError.dart';
import 'package:gayatri_mobile_world/MorePage/Select_State.dart';
import 'package:gayatri_mobile_world/customfolder/InputDecoration.dart';
// import 'package:gayatrimobileworld/AppThemes/AppColors.dart';
// import 'package:gayatrimobileworld/AppThemes/TextThemes.dart';
// import 'package:gayatrimobileworld/AppThemes/ToastError.dart';
// import 'package:gayatrimobileworld/MorePage/Select_State.dart';
// import 'package:gayatrimobileworld/customfolder/InputDecoration.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'Select_Brand_Page.dart';
import 'Select_City_Page.dart';
import 'Select_State_Page.dart';
import '../customfolder/custom_things.dart';



class SellProductPage extends StatefulWidget {
  const SellProductPage({super.key});

  @override
  State<SellProductPage> createState() => _SellProductPageState();
}

class _SellProductPageState extends State<SellProductPage> {

  List<File> _images = [];
  final int _imageLimit = 5; // Set the limit for images

  Future<void> _pickImage(ImageSource source) async {
    if (_images.length >= _imageLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You can only upload up to $_imageLimit images."),
        ),
      );
      return;
    }
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      // Crop the image after selecting
      final croppedFile = await ImageCropper().cropImage(sourcePath: pickedFile.path,compressQuality: 30);

      if (croppedFile != null) {
        setState(() {
          _images.add(File(croppedFile.path)); // Add the cropped image to the list
        });
      }
    }
    // final pickedFile = await ImagePicker().pickImage(source: source);
    // if (pickedFile != null) {
    //   setState(() {
    //     _images.add(File(pickedFile.path));
    //   });
    // }
    Navigator.pop(context);
  }

  void _showImagePicker() {
    if (_images.length >= _imageLimit) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You can only upload up to $_imageLimit images."),
        ),
      );
      return;
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.photo_library,
                    size: customstheam.icon_s,
                    color: customstheam.icon_col,
                  ),
                  title: Text(
                    "Gallery",
                    style: TextStyle(fontSize: customstheam.text_responsive18),
                  ),
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    size: customstheam.icon_s,
                    color: customstheam.icon_col,
                  ),
                  title: Text(
                    "Camera",
                    style: TextStyle(fontSize: customstheam.text_responsive18),
                  ),
                  onTap: () => _pickImage(ImageSource.camera),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  String? selectedBrand;

  InputDecoration _inputDecoration(String lable,String hinttext) {
    return InputDecoration(
      label: Text(lable),
      labelStyle:TextStyle(color: Colors.grey,fontSize: customstheam.text_responsive,),
      hintText: hinttext,
      hintStyle:TextStyle(color: Colors.grey,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400,),
      enabledBorder:CustomInputDecoration.CustomDeco(context),
      border: CustomInputDecoration.CustomDeco(context),
      focusedBorder: CustomInputDecoration.CustomDeco(context),
      focusedErrorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(width:MediaQuery.sizeOf(context).width*0.0025,color: Colors.red),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).height*0.018 , vertical:MediaQuery.sizeOf(context).width*0.012),
    );
  }

  TextEditingController statecontroller=new TextEditingController();
  TextEditingController citycontroller=new TextEditingController();

  Widget _selectField(String label, String? value, VoidCallback onTap) {
    return GestureDetector(
        onTap: onTap,
        child:TextFormField(
            style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
            enabled: false,
            decoration: InputDecoration(
              label: Text( value??label),
              labelStyle:TextStyle(color: value == null ? Colors.grey : Colors.black,fontSize: customstheam.text_responsive),
              suffixIcon: Icon(Icons.arrow_forward_ios, size: customstheam.text_responsive, color: Colors.black),
              enabledBorder:CustomInputDecoration.CustomDeco(context),
              border: CustomInputDecoration.CustomDeco(context),
              focusedBorder: CustomInputDecoration.CustomDeco(context),
              disabledBorder: CustomInputDecoration.CustomDeco(context),
              contentPadding: EdgeInsets.symmetric(horizontal:MediaQuery.sizeOf(context).height*0.018 , vertical:MediaQuery.sizeOf(context).width*0.012),
            )
        )
    );
  }

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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width*0.05),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pls note: Your Mobile Ad will be live for 7 days to all sellers registed on Gayatri Mobile Word.",
                style: TextStyle(color: customstheam.icon_col,fontWeight:FontWeight.w400,fontSize: customstheam.text_responsive16),),
              SizedBox(height: height*0.015,),

              Text('OWNER DETAILS',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: customstheam.text_responsive16)),
              SizedBox(height: height*0.015),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                decoration: _inputDecoration('Name','Enter Your Name',),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              SizedBox(height:height*0.015),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                decoration: _inputDecoration('Contact Number','Enter Your Contact Number'),
                keyboardType: TextInputType.phone,
                // validator: (value) => value!.isEmpty ? 'Enter your number' : null,
              ),
              SizedBox(height:height*0.015),

              //select state
              InkWell(
                onTap: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectStateOfIndia(
                    statecontroller: statecontroller,
                    iscitypicker: false,
                    citycontroller: citycontroller,
                  )));
                  setState(() {});
                },
                child: TextFormField(
                  controller: statecontroller,
                  style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    enabled: false,
                    border: CustomInputDecoration.CustomDeco(context),
                    disabledBorder: CustomInputDecoration.CustomDeco(context),
                    hintText: "Select State...",
                    // hintText: statecontroller.text.isEmpty?"Select State...":"${statecontroller.text}",
                    hintStyle:TextStyle(color: Colors.grey,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400,),
                    suffixIcon: Icon(Icons.arrow_forward_ios, size: customstheam.text_responsive, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal:height*0.018 , vertical:width*0.012),
                  ),
                ),
              ),
              SizedBox(height: height*0.015,),

              //select city
              InkWell(
                onTap: ()async{
                  statecontroller.text.isNotEmpty?await Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectStateOfIndia(
                    statecontroller: statecontroller,
                    citycontroller: citycontroller,
                    iscitypicker: true,
                  ))): ToastError.errorNotification(context, "Please Select State First");
                  setState(() {});
                },
                child: TextFormField(
                  style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                  controller: citycontroller,
                  decoration: InputDecoration(
                    enabled: false,
                    border: CustomInputDecoration.CustomDeco(context),
                    disabledBorder: CustomInputDecoration.CustomDeco(context),
                    // hintText:citycontroller.text.isEmpty? "Select City...":"${citycontroller.text}",
                    hintText: "Select City...",
                    hintStyle:TextStyle(color: Colors.grey,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400,),
                    suffixIcon: Icon(Icons.arrow_forward_ios, size: customstheam.text_responsive, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(horizontal:height*0.018 , vertical:width*0.012),
                  ),
                ),
              ),
              SizedBox(height: height*0.015,),

              _selectField('Select Brand...',selectedBrand,() async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SelectBrandScreen()),
                  );
                  setState(() => selectedBrand = result);
                },
              ),
              SizedBox(height:height*0.015),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                decoration: _inputDecoration('Product Title','Enter Your Product Title'),
                validator: (value) => value!.isEmpty ? 'Enter product title' : null,
              ),
              SizedBox(height:height*0.015),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                decoration: _inputDecoration('Product Description','Enter Your Product Description'),
                validator: (value) => value!.isEmpty ? 'Enter product description' : null,
              ),
              SizedBox(height:height*0.015),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: customstheam.text_responsive,fontWeight: FontWeight.w400),
                decoration: _inputDecoration('Offer Price','Enter Your Offer Price'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter offer price' : null,
              ),
              SizedBox(height:height*0.015),

              Text(
                "PRODUCT IMAGES (${_images.length}/$_imageLimit)",
                style: TextStyle(fontSize: customstheam.text_responsive16, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: height*0.015),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    if (_images.length < _imageLimit)
                      InkWell(
                        onTap: _showImagePicker,
                        child: Container(
                          height: width*0.25,
                          width: width*0.25,
                          decoration: BoxDecoration(
                            border: Border.all(color: customstheam.icon_col),
                            borderRadius: BorderRadius.circular(8),
                            color: customstheam.icon_col.withOpacity(0.1),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: customstheam.icon_s),
                                Text(
                                  "Product",
                                  style: TextStyle(fontSize: customstheam.text_responsive, fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "image",
                                  style: TextStyle(fontSize: customstheam.text_responsive, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    SizedBox(width: 10),
                    ..._images.map((image) => Stack(
                      children: [
                        Container(
                          height: width*0.25,
                          width: width*0.25,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: customstheam.icon_col),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 15,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _images.remove(image);
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: customstheam.icon_col,
                                border: Border.all(color: customstheam.icon_col, width: 2),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  size: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: height*0.018, vertical: width*0.012),
        // Padding: EdgeInsets.symmetric(horizontal:height*0.018 , vertical:width*0.012),

        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Form submitted successfully!')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:customstheam.icon_col,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: customstheam.text_responsive16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),

    );
  }
}

















// import 'package:flutter/material.dart';
// import 'Select_Brand_Page.dart';
// import 'Select_City_Page.dart';
// import 'Select_State_Page.dart';
// import '../customfolder/custom_things.dart';
//
//
//
// class SellProductPage extends StatefulWidget {
//   const SellProductPage({super.key});
//
//   @override
//   State<SellProductPage> createState() => _SellProductPageState();
// }
//
// class _SellProductPageState extends State<SellProductPage> {
//
//
//   final _formKey = GlobalKey<FormState>();
//   String? selectedState, selectedCity, selectedBrand;
//
//   InputDecoration _inputDecoration(String lable) {
//     return InputDecoration(
//       hintText: lable,
//       enabledBorder:OutlineInputBorder(
//         borderRadius: BorderRadius.circular(16.0),
//         borderSide: BorderSide(color: customstheam.icon_col,width: 1.5),
//     ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(16.0),
//         borderSide: BorderSide(color: customstheam.icon_col),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8.0),
//         borderSide: BorderSide(color: customstheam.icon_col),
//       ),
//       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     );
//   }
//
//
//   Widget _selectField(String label, String? value, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         // margin: EdgeInsets.only(top: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           border: Border.all(
//             color: customstheam.icon_col,
//             width: 1.5,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 value ?? label,
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: value == null ? Colors.grey.shade700 : Colors.grey.shade700,
//                 ),
//               ),
//               Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
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
//         title: Text('Add cellphone details',style: TextStyle(fontSize: 18),),
//         centerTitle: true,
//         // backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.only(left: 16,right:16,bottom: 16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Pls note: Your Mobile Ad will be live for 7 days to all sellers registed on Gayatri Mobile Word",
//                     style: TextStyle(color: Colors.green,fontWeight:FontWeight.w500,fontSize: 15),),
//               SizedBox(height: 12,),
//               Text('OWNER DETAILS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
//               SizedBox(height: 12),
//
//               TextFormField(
//                 decoration: _inputDecoration('Your name'),
//                 validator: (value) => value!.isEmpty ? 'Enter your name' : null,
//               ),
//               SizedBox(height: 12),
//               TextFormField(
//                 decoration: _inputDecoration('Number'),
//                 keyboardType: TextInputType.phone,
//                 // validator: (value) => value!.isEmpty ? 'Enter your number' : null,
//               ),
//               SizedBox(height: 12),
//               _selectField(
//                 'Select State...',
//                 selectedState,
//                     () async {
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => SelectStateScreen()),
//                   );
//                   setState(() => selectedState = result);
//                 },
//               ),
//               SizedBox(height: 12),
//               _selectField(
//                 'Select City...',
//                 selectedCity,
//                     () async {
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => SelectCityScreen()),
//                   );
//                   setState(() => selectedCity = result);
//                 },
//               ),
//               SizedBox(height: 12),
//               _selectField(
//                 'Select Brand...',
//                 selectedBrand,
//                     () async {
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => SelectBrandScreen()),
//                   );
//                   setState(() => selectedBrand = result);
//                 },
//               ),
//               SizedBox(height: 12),
//               TextFormField(
//                 decoration: _inputDecoration('Product title'),
//                 validator: (value) => value!.isEmpty ? 'Enter product title' : null,
//               ),
//               SizedBox(height: 12),
//               TextFormField(
//                 decoration: _inputDecoration('Product description'),
//                 validator: (value) => value!.isEmpty ? 'Enter product description' : null,
//               ),
//               SizedBox(height: 12),
//               TextFormField(
//                 decoration: _inputDecoration('Offer price'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) => value!.isEmpty ? 'Enter offer price' : null,
//               ),
//               SizedBox(height: 20),
//               Text('PRODUCT IMAGES (5)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//               SizedBox(height: 10),
//
//               InkWell(
//                 onTap: () {
//                   showModalBottomSheet(
//                     isScrollControlled: true,
//                     context: context, builder: (context) {
//                     return
//                         Container(
//
//                           height: 75,
//                           child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               InkWell(
//                                 onTap: (){},
//                                 child: Center(
//                                   child: Container(
//                                     height: 75,
//                                     width: width/2,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(Icons.photo,color: customstheam.icon_col,),
//                                         SizedBox(width: 10,),
//                                         Text("Gallery",style: TextStyle(fontSize: 15),)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//
//                                 onTap: (){},
//                                 child: Center(
//                                   child: Container(
//                                     height:75,
//                                     width:width/2,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Icon(Icons.camera,color: customstheam.icon_col,),
//                                         SizedBox(width: 10,),
//                                         Text("Camera",style: TextStyle(fontSize: 15),)
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                   },
//                   );
//
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     border: Border.all(color:customstheam.icon_col),
//                     borderRadius: BorderRadius.circular(5),
//                     color:customstheam.icon_col.withOpacity(0.1),
//                   ),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.add, size: 30,),
//                         Text("Product",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
//                         Text("image",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//
//       bottomNavigationBar: Container(
//         color: Colors.white,
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//
//         child: ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Form submitted successfully!')),
//               );
//             }
//           },
//           style: ElevatedButton.styleFrom(
//             backgroundColor:customstheam.icon_col,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             padding: EdgeInsets.symmetric(vertical: 14),
//           ),
//           child: Text(
//             'Submit',
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//         ),
//       ),
//
//     );
//   }
// }
