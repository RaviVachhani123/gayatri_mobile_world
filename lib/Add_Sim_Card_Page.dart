import 'package:flutter/material.dart';

import 'customfolder/custom_things.dart';

class AddSimCardPage extends StatefulWidget {
  const AddSimCardPage({super.key});

  @override
  State<AddSimCardPage> createState() => _AddSimCardPageState();
}

class _AddSimCardPageState extends State<AddSimCardPage> {

  DateTime? _activationDate;

  final _formKey = GlobalKey<FormState>();
  // String? selectedproof = 'Select pfoof';
  final GlobalKey _selectIdProofKey = GlobalKey();
  TextEditingController selectedIdProof = TextEditingController();
  final List proof_of_indentity = ['Aadhar', 'Pan Card',"Voter ID","Driving Licence","Passport"];

  _showPopupMenu(context) async{
    final RenderBox renderBox = _selectIdProofKey.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero); // Get widget position
    final Size size = renderBox.size; // Get widget size
    final width=MediaQuery.sizeOf(context).width;
    return await showMenu(
        context: context,
        constraints: BoxConstraints(
            maxWidth: width*0.9
        ),
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


    Future<void> _aDate(BuildContext context) async {
      final DateTime? pickedEndDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.green,
              hintColor: Colors.green,
              colorScheme: ColorScheme.light(
                primary: customstheam.icon_col,
                onPrimary: Colors.white,
                onSurface: customstheam.icon_col,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: customstheam.icon_col,
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (pickedEndDate != null) {
        setState(() {
          _activationDate = pickedEndDate;
        });
      } else {
        setState(() {
          _activationDate = null;
        });
      }
    }


  @override
  Widget build(BuildContext context) {
    final double height= MediaQuery.sizeOf(context).height;
    final double width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Add Sim Card',
          style: TextStyle(fontSize: 24),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SIM DETAILS",style: TextStyle(fontSize: 16,fontWeight: customstheam.h1_weight,),),
                SizedBox(height: 12,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        //airtel
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: customstheam.icon_col,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),

                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset("assets/images/Bharti_Airtel_Logo.svg.png",width: 40,height: 40,),
                               SizedBox(height: 4,),
                                Text("Airtel",style: TextStyle(fontSize: customstheam.h1),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        //jio
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: customstheam.icon_col,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),

                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset("assets/images/Reliance_Jio_Logo.svg.png",width: 40,height: 40,),
                                SizedBox(height: 4,),
                                Text("Jio",style: TextStyle(fontSize: customstheam.h1),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        //vi
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: customstheam.icon_col,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),

                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset("assets/images/Vodafone_Idea_logo.svg.png",width: 40,height: 40,),
                                SizedBox(height: 4,),
                                Text("Vi",style: TextStyle(fontSize: customstheam.h1),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        //bsnl
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: customstheam.icon_col,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),

                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Image.asset("assets/images/BSNL_logo_with_slogan.svg.png",width: 40,height: 40,),
                                SizedBox(height: 4,),
                                Text("BSNL",style: TextStyle(fontSize: customstheam.h1),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),

                // Customer Name
                TextFormField(
                  decoration: _inputDecoration('Customer name'),
                  validator: (value) => value!.isEmpty ? 'Customer name' : null,
                ),
                SizedBox(height: 14,),

                //Mobile No
                TextFormField(
                  decoration: _inputDecoration('Mobile No.'),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please Enter a valid 10-digit Mobile No.';
                    }
                      return null;
                      },
                ),
                SizedBox(height: 14),

                //SIM+ FRC Amount
                TextFormField(
                  decoration: _inputDecoration('Sim + FRC Amount'),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14,),

                //Customer photo
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
                                onTap: (){},
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

                                onTap: (){},
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
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color:customstheam.icon_col),
                      borderRadius: BorderRadius.circular(10),
                      color:customstheam.icon_col.withOpacity(0.1),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, size: 30,),
                          Text("Customer",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                          Text("photo",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 14,),
                //Activation date

                SizedBox(height: 14,),

                GestureDetector(
                  onTap: () => _aDate(context), // Trigger date picker
                  child: TextFormField(
                    enabled: false, // Prevents manual editing
                    decoration: InputDecoration(
                      hintText: _activationDate != null
                          ? "${_activationDate!.day}/${_activationDate!.month}/${_activationDate!.year}"
                          : 'Activation date',
                      hintStyle: TextStyle(
                        fontSize: customstheam.h1,
                        color: Colors.black,
                        fontWeight: customstheam.h1_weight,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: customstheam.icon_col,
                          width: 1.0,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(
                          color: customstheam.icon_col,
                          width: 1.0,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixIcon: Icon(Icons.navigate_next, color: Colors.grey),
                    ),
                    controller: TextEditingController(
                      text: _activationDate != null
                          ? "${_activationDate!.year}/${_activationDate!.month}/${_activationDate!.day}"
                          : '',
                    ),
                  ),
                ),
                SizedBox(height: 14,),


                //Present address
                TextFormField(
                  decoration: _inputDecoration('Present address'),
                  validator: (value) => value!.isEmpty ? 'Present address' : null,
                ),
                SizedBox(height: 14,),

                //Present Pincode
                TextFormField(
                  decoration: _inputDecoration('Present Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Mobile No.';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit Mobile No.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14,),

                //Present State
                TextFormField(
                  decoration: _inputDecoration('Present State'),
                  validator: (value) => value!.isEmpty ? 'Present State' : null,
                ),
                SizedBox(height: 14,),

                //Present City
                TextFormField(
                  decoration: _inputDecoration('Present City'),
                  validator: (value) => value!.isEmpty ? 'Present City' : null,
                ),
                SizedBox(height: 14,),

                //Permanent address
                TextFormField(
                  decoration: _inputDecoration('Permanent address'),
                  validator: (value) => value!.isEmpty ? 'Permanent address' : null,
                ),
                SizedBox(height: 14,),

                //Permanent Pincode
                TextFormField(
                  decoration: _inputDecoration('Permanent Pincode'),
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Mobile No.';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit Mobile No.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14,),

                //Permanent State
                TextFormField(
                  decoration: _inputDecoration('Permanent State'),
                  validator: (value) => value!.isEmpty ? 'Permanent State' : null,
                ),
                SizedBox(height: 14,),

                //Permanent City
                TextFormField(
                  decoration: _inputDecoration('Permanent City'),
                  validator: (value) => value!.isEmpty ? 'Permanent City' : null,
                ),
                SizedBox(height: 14,),

                // Select Id proof
                InkWell(
                  onTap: ()async{
                    final selectedproof = await _showPopupMenu(context);
                    if(selectedproof!=null){
                      selectedIdProof.text = selectedproof;
                    }
                  },
                  child: TextFormField(
                    key: _selectIdProofKey,
                    readOnly: true,
                    enabled: false,
                    decoration: InputDecoration(
                      // labelText: 'Select ID Proof',
                      hintText: 'Select Id proof',
                      hintStyle: TextStyle(fontSize: 16),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(color: Colors.teal, width: 1.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    controller: selectedIdProof,
                  ),
                ),


                SizedBox(height: 14,),
                // Container(
                //   // margin: EdgeInsets.only(top: 12),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(16.0),
                //     border: Border.all(
                //       color: customstheam.icon_col,
                //       width: 1.5,
                //     ),
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           value ?? label,
                //           style: TextStyle(
                //             fontSize: 16,
                //             color: value == null ? Colors.grey.shade700 : Colors.grey.shade700,
                //           ),
                //         ),
                //         Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                //       ],
                //     ),
                //   ),
                // ),


                //Identity No.
                TextFormField(
                  decoration: _inputDecoration('Identity No.'),
                  validator: (value) => value!.isEmpty ? 'Identity No.' : null,
                ),
                SizedBox(height: 14,),


                //Alternate number
                TextFormField(
                  decoration: _inputDecoration('Alternate number'),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14,),


                //Local reference name
                TextFormField(
                  decoration: _inputDecoration('Local reference name'),
                  validator: (value) => value!.isEmpty ? 'Local reference name' : null,
                ),
                SizedBox(height: 14,),

                //Local reference mobile
                TextFormField(
                  decoration: _inputDecoration('Local reference mobile'),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14,),

                //Local reference address
                TextFormField(
                  decoration: _inputDecoration('Local reference address'),
                  validator: (value) => value!.isEmpty ? 'Local reference address' : null,
                ),
                SizedBox(height: 14,),

                //Add Sim

                Container(
                  width: width,
                  child: ElevatedButton(
                    onPressed: () {
                    //   if (_formKey.currentState!.validate()) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text('Form submitted successfully!')),
                    //     );
                    //   }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:customstheam.icon_col,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      'Add Sim',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),

    );
  }
}


