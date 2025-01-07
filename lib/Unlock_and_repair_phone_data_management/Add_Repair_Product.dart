import 'package:flutter/material.dart';
import '../MorePage/Select_Brand_Page.dart';
import '../customfolder/custom_things.dart';

class AddRepairPhone extends StatefulWidget {
  const AddRepairPhone({super.key});

  @override
  State<AddRepairPhone> createState() => _AddRepairPhoneState();
}

class _AddRepairPhoneState extends State<AddRepairPhone> {
  bool isSimChecked = false;
  bool ismemoryChecked = false;
  bool isbatteryChecked = false;

  DateTime? _activationDate;
  final _formKey = GlobalKey<FormState>();
  String? selectedBrand;

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

  //select brand
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

  //Estimate Delivery Date
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Add Repair Phone',style: TextStyle(fontSize:18),),
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

                  ///Job no
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Job no",
                      hintText: "Job no",
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
                    ),
                    // maxLength: 10,
                    keyboardType: TextInputType.number,
                    initialValue: "1",
                  ),
                  SizedBox(height: 14),


                  ///name
                  TextFormField(
                      decoration: _inputDecoration('Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required!';
                        }
                        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'name can only contain letters and spaces';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 14,),

                  ///contact no
                  TextFormField(
                    decoration: _inputDecoration('contact no'),
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
                    'Select Brand',
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

                  ///Model
                  TextFormField(
                      decoration: _inputDecoration('Model'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required!';
                        }
                        if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                          return 'name can only contain letters and spaces';
                        }
                        return null;
                      }
                  ),
                  SizedBox(height: 14,),

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
                          hintText: 'IMEI NO (Optinal)',
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

                  ///Problem
                  TextFormField(decoration:InputDecoration(
                    hintText: "Problem",
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  )
                  ),
                  SizedBox(height: 14,),




                  ///Estimate Amount
                  TextFormField(
                    decoration: _inputDecoration('Estimate Amount'),
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


                  ///Estimate Delivery Date
                  GestureDetector(
                    onTap: () => _aDate(context), // Trigger date picker
                    child: TextFormField(
                      enabled: false, // Prevents manual editing
                      decoration: InputDecoration(
                        hintText: _activationDate != null
                            ? "${_activationDate!.day}/${_activationDate!.month}/${_activationDate!.year}"
                            : 'Estimate Delivery Date',
                        hintStyle: TextStyle(
                          fontSize: customstheam.h1,
                          color: Colors.black,
                          fontWeight: customstheam.h1_weight,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: customstheam.icon_col,
                            width: 1.5,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                            color: customstheam.icon_col,
                            width: 1.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        suffixIcon: Icon(Icons.calendar_month_outlined,color: Colors.black,),
                      ),
                      controller: TextEditingController(
                        text: _activationDate != null
                            ? "${_activationDate!.day}/${_activationDate!.month}/${_activationDate!.year}"
                            : '',
                      ),
                    ),
                  ),
                  SizedBox(height: 14,),


                  Row(
                    children: [
                      ///sim
                      Checkbox(
                        value: isSimChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isSimChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Sim',
                        style: TextStyle(fontSize: 16),
                      ),

                      ///Memory
                      Checkbox(
                        value: ismemoryChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            ismemoryChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Memory',
                        style: TextStyle(fontSize: 16),
                      ),

                      ///battery
                      Checkbox(
                        value: isbatteryChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isbatteryChecked = value ?? false;
                          });
                        },
                      ),
                      Text(
                        'Battery',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 14,),


                  ///submit
                  Container(
                    width: width,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 12),
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



                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
