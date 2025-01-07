import 'package:flutter/material.dart';
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


  final _formKey = GlobalKey<FormState>();
  String? selectedState, selectedCity, selectedBrand;

  InputDecoration _inputDecoration(String lable) {
    return InputDecoration(
      hintText: lable,
      enabledBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(color: customstheam.icon_col,width: 1.5),
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
                  color: value == null ? Colors.grey.shade700 : Colors.grey.shade700,
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
        title: Text('Add cellphone details',style: TextStyle(fontSize: 18),),
        centerTitle: true,
        // backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16,right:16,bottom: 16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pls note: Your Mobile Ad will be live for 7 days to all sellers registed on Gayatri Mobile Word",
                    style: TextStyle(color: Colors.green,fontWeight:FontWeight.w500,fontSize: 15),),
              SizedBox(height: 12,),
              Text('OWNER DETAILS', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              SizedBox(height: 12),

              TextFormField(
                decoration: _inputDecoration('Your name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: _inputDecoration('Number'),
                keyboardType: TextInputType.phone,
                // validator: (value) => value!.isEmpty ? 'Enter your number' : null,
              ),
              SizedBox(height: 12),
              _selectField(
                'Select State...',
                selectedState,
                    () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SelectStateScreen()),
                  );
                  setState(() => selectedState = result);
                },
              ),
              SizedBox(height: 12),
              _selectField(
                'Select City...',
                selectedCity,
                    () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SelectCityScreen()),
                  );
                  setState(() => selectedCity = result);
                },
              ),
              SizedBox(height: 12),
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
              SizedBox(height: 12),
              TextFormField(
                decoration: _inputDecoration('Product title'),
                validator: (value) => value!.isEmpty ? 'Enter product title' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: _inputDecoration('Product description'),
                validator: (value) => value!.isEmpty ? 'Enter product description' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                decoration: _inputDecoration('Offer price'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter offer price' : null,
              ),
              SizedBox(height: 20),
              Text('PRODUCT IMAGES (5)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 10),

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
                    borderRadius: BorderRadius.circular(5),
                    color:customstheam.icon_col.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 30,),
                        Text("Product",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                        Text("image",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
            padding: EdgeInsets.symmetric(vertical: 14),
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
