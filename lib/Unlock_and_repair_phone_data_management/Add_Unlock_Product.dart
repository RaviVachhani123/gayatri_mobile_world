import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../MorePage/Select_Brand_Page.dart';
import '../customfolder/custom_things.dart';
import 'dart:io';
class AddUnlockProduct extends StatefulWidget {
  const AddUnlockProduct({super.key});

  @override
  State<AddUnlockProduct> createState() => _AddUnlockProductState();
}

class _AddUnlockProductState extends State<AddUnlockProduct> {

  XFile? image1;
  XFile? image2;
  XFile? image3;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey _selectIdProofKey = GlobalKey();
  String? selectedState, selectedCity, selectedBrand;
  final List proof_of_indentity = ['Aadhar', 'Pan Card',"Voter ID","Driving Licence","Passport"];
  TextEditingController selectedIdProof = TextEditingController();



  //select id proof
  _showPopupMenu(context) async{
    final RenderBox renderBox = _selectIdProofKey.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero); // Get widget position
    final Size size = renderBox.size; // Get widget size
    final width=MediaQuery.sizeOf(context).width;
    return await showMenu(
        context: context,
        constraints: BoxConstraints(
            maxWidth: width-32
        ),
        color: Colors.white,
        position: RelativeRect.fromLTRB(
          offset.dx, // Left edge
          offset.dy + size.height, // Below the widget
          offset.dx + size.width, // Right edge
          offset.dy, // Top edge
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        items: proof_of_indentity.map((proof){
          return PopupMenuItem(
            value: proof,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: Text("$proof"),
            ),
          );
        }).toList());
  }

  InputDecoration _inputDecoration(String lable) {
    return InputDecoration(
      hintText: lable,
      hintStyle: TextStyle(fontSize: customstheam.h1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: customstheam.icon_col),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: customstheam.icon_col),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }

  Widget _selectField(String label, String? value, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: customstheam.icon_col,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value ?? label,
                style: TextStyle(
                  fontSize: 16,
                  color: value == null ? Colors.grey.shade800 : Colors.grey.shade800,
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.sizeOf(context).height;
    final double width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add',style: TextStyle(fontSize:18),),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  ///customer name
                  TextFormField(
                    decoration: _inputDecoration('Customer name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'required!';
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return 'Customer name can only contain letters and spaces';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 14,),

                  ///mobile no
                  TextFormField(
                    decoration: _inputDecoration('Mobile No.'),
                    // maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'required!';
                      }
                      if (value.length != 10) {
                        return 'Enter a valid number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only digits are allowed';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14),

                  ///Select Brand
                  _selectField(
                    'Select Brand...',
                    selectedBrand,
                        () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SelectBrandScreen()),
                      );
                      setState(() => selectedBrand = result);
                    },
                  ),
                  SizedBox(height: 14),

                  ///IMEI no.
                  Container(
                    width: width,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
                              borderRadius: BorderRadius.circular(16)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
                              borderRadius: BorderRadius.circular(16)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
                              borderRadius: BorderRadius.circular(16)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
                              borderRadius: BorderRadius.circular(16)),
                          hintText: 'IMEI No.',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize:14,
                          ),
                          suffixIcon: IconButton(onPressed: (){
                            ///TODO: Open The Camera in popup
                          }, icon: Icon(Icons.qr_code))
                      ),
                    ),
                  ),
                  SizedBox(height: 14),

                  ///Select Id proof

                  InkWell(
                    onTap: ()async{
                      final selectedproof = await _showPopupMenu(context);
                      if(selectedproof!=null){
                        selectedIdProof.text = selectedproof;
                      }
                    },
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black
                      ),
                      key: _selectIdProofKey,
                      // readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Select ID Proof',
                        hintText: 'Select Id proof',
                        hintStyle: TextStyle(fontSize: 16),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          borderSide: BorderSide(color: customstheam.icon_col, width: 1.5),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                      controller: selectedIdProof,
                    ),
                  ),
                  SizedBox(height: 14),

                  ///identity no
                  TextFormField(
                      decoration: _inputDecoration('ID - Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'required!';
                        }
                        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'Customer name can only contain letters and spaces';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 14,),

                  ///part changes
                  TextFormField(
                    decoration: _inputDecoration('Part Changes'),
                    // maxLength: 10,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if (value == null || value.isEmpty) {
                        return 'required!';
                      }
                      if (value.length != 10) {
                        return 'Enter a valid number';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Only digits are allowed';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14,),

                  ///Add Image
                  Text("Add Image",style: TextStyle(fontWeight: customstheam.h1_weight,fontSize: customstheam.h1),),
                  SizedBox(height: 14,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, builder: (context) {
                            return
                              Container(
                                height: 75,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: ()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if (pic!=null){
                                          image1 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 75,
                                          width: width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.photo,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Gallery",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.camera);
                                        if (pic!=null){
                                          image1 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height:75,
                                          width:width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.camera,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Camera",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: image1==null?Container(
                          height: 135,
                          width: width*0.28,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_outlined,),
                              ],
                            ),
                          ),
                        ):Container(
                          child: Image.file(
                            File(image1!.path),fit:BoxFit.cover,
                            height: 135,
                            width: width*0.28,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, builder: (context) {
                            return
                              Container(
                                height: 75,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: ()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if (pic!=null){
                                          image2 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 75,
                                          width: width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.photo,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Gallery",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: ()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.camera);
                                        if (pic!=null){
                                          image2 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height:75,
                                          width:width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.camera,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Camera",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          },
                          );
                        },
                        child:image2==null? Container(
                          height: 135,
                          width: width*0.28,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_outlined,),
                              ],
                            ),
                          ),
                        ):Container(
                          child: Image.file(
                            File(image2!.path),fit:BoxFit.cover,
                            height: 135,
                            width: width*0.28,
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context, builder: (context) {
                            return
                              Container(
                                height: 75,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: ()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.gallery);
                                        if (pic!=null){
                                          image3 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height: 75,
                                          width: width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.photo,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Gallery",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap:()async{
                                        final pic=await ImagePicker().pickImage(source: ImageSource.camera);
                                        if (pic!=null){
                                          image3 = pic;
                                          setState(() {

                                          });
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                          height:75,
                                          width:width/2,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(Icons.camera,color: customstheam.icon_col,),
                                              SizedBox(width: 10,),
                                              Text("Camera",style: TextStyle(fontSize: 15),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                          },
                          );
                        },
                        child:image3==null? Container(
                          height: 135,
                          width: width*0.28,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_outlined,),
                              ],
                            ),
                          ),
                        ):Container(
                          child: Image.file(
                            File(image3!.path),fit:BoxFit.cover,
                            height: 135,
                            width: width*0.28,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14,),


                ],
              ),
        
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
            padding: EdgeInsets.symmetric(vertical: 12),
          ),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
