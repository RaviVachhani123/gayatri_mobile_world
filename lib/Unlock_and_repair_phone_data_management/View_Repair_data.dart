import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../customfolder/custom_things.dart';
import 'Add_Repair_Product.dart';
class ViewRepairData extends StatefulWidget {
  const ViewRepairData({super.key});

  @override
  State<ViewRepairData> createState() => _ViewRepairDataState();
}


class _ViewRepairDataState extends State<ViewRepairData> {
  int initial_count_all_phone = 0;
  int initial_count_Delivered_Phone = 0;
  int initial_count_Todays_Due = 0;
  int initial_count_upcoming = 0;

  String heading_text="Today's Due";
  int selected_card = 3;



  DateTime? _startDate;
  DateTime? _endDate;

  String _selectedType = 'All';

  Future<void> _sDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
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
    if (pickedDate != null) {
      setState(() {
        _startDate = pickedDate;
      });
    } else {
      setState(() {
        _startDate = null;
      });
    }
  }

  Future<void> _eDate(BuildContext context) async {
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
        _endDate = pickedEndDate;
      });
    } else {
      setState(() {
        _endDate = null;
      });
    }
  }

  bool get _isDownloadButtonEnabled => _startDate != null && _endDate != null;


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Allphone
                InkWell(
                  onTap: (){
                    setState(() {
                      heading_text="All Phone";
                      selected_card=1;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                    side:selected_card==1? BorderSide(color: customstheam.icon_col,width: 1):BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  shadowColor:Colors.black,
                  elevation: 5,
                  child: Container(
                  width: width*0.28,
                  height: width*0.28,
                  // color: Colors.red,
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment(-0.9,-0.8),
                          child: Text("$initial_count_all_phone",style: TextStyle(fontSize:width*0.04,fontWeight: customstheam.h1_weight),),
                      ),
                      Align(
                          alignment: Alignment(-0.1, 0.4),
                          child: IntrinsicHeight(
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width*0.02),
                                  child: Row(
                                    children: [
                                      Text("All",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                    ],
                                  ),
                                ),

                                Padding(
                                  padding: EdgeInsets.only(left: width*0.02),
                                  child: Row(
                                    children: [
                                      Text("Phone",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      ),
                      Align(
                        alignment: Alignment(-0.7, 0.8),
                        child: Container(
                          height: height*0.007,
                          width:width*0.1 ,
                          decoration: BoxDecoration(
                            color: customstheam.icon_col,
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.1, 0.8),
                        child: Container(
                          height: height*0.007,
                          width:width*0.03 ,
                          decoration: BoxDecoration(
                            color: customstheam.icon_col,
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ),
                  ),
                ),
                ///delivered phone
                InkWell(
                  onTap: (){
                    setState(() {
                      heading_text="Delivered Phone";
                      selected_card=2;
                    });
                  },
                  child: Card(
                  shape: RoundedRectangleBorder(
                      side:selected_card==2? BorderSide(color: customstheam.icon_col,width: 1):BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  shadowColor:Colors.black,
                  elevation: 5,
                  child: Container(
                    width: width*0.28,
                    height: width*0.28,
                    // color: Colors.red,
                    child: Stack(
                      children: [

                        ///counter
                        Align(
                          alignment: Alignment(-0.9,-0.8),
                          child: Text("$initial_count_Delivered_Phone",style: TextStyle(fontSize:width*0.04,fontWeight: customstheam.h1_weight),),
                        ),
                        Align(
                            alignment: Alignment(-0.1, 0.4),
                            child: IntrinsicHeight(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: width*0.02),
                                    child: Row(
                                      children: [
                                        Text("Delivered",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: width*0.02),
                                    child: Row(
                                      children: [
                                        Text("Phone",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                        Align(
                          alignment: Alignment(-0.7, 0.8),
                          child: Container(
                            height: height*0.007,
                            width:width*0.1 ,
                            decoration: BoxDecoration(
                              color: customstheam.icon_col,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.1, 0.8),
                          child: Container(
                            height: height*0.007,
                            width:width*0.03 ,
                            decoration: BoxDecoration(
                              color: customstheam.icon_col,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
                ///today's due
                InkWell(
                  onTap: ()
                  {

                    setState(() {
                      heading_text="Today's Due";
                      selected_card=3;
                    });
                  },
                  child: Card(
                  shape: RoundedRectangleBorder(
                      side:selected_card==3? BorderSide(color: customstheam.icon_col,width: 1):BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  shadowColor:Colors.black,
                  elevation: 5,
                  child: Container(
                    width: width*0.28,
                    height: width*0.28,
                    // color: Colors.red,
                    child: Stack(
                      children: [

                        ///counter
                        Align(
                          alignment: Alignment(-0.9,-0.8),
                          child: Text("$initial_count_Todays_Due",style: TextStyle(fontSize:width*0.04,fontWeight: customstheam.h1_weight),),
                        ),
                        Align(
                            alignment: Alignment(-0.1, 0.4),
                            child: IntrinsicHeight(
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: width*0.02),
                                    child: Row(
                                      children: [
                                        Text("Today's",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.only(left: width*0.02),
                                    child: Row(
                                      children: [
                                        Text("Phone",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                        Align(
                          alignment: Alignment(-0.7, 0.8),
                          child: Container(
                            height: height*0.007,
                            width:width*0.1 ,
                            decoration: BoxDecoration(
                              color: customstheam.icon_col,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.1, 0.8),
                          child: Container(
                            height: height*0.007,
                            width:width*0.03 ,
                            decoration: BoxDecoration(
                              color: customstheam.icon_col,
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///upcoming due
                InkWell(
                  onTap: (){
                    setState(() {
                      heading_text="Upcoming Due";
                      selected_card=4;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side:selected_card==4? BorderSide(color: customstheam.icon_col,width: 1):BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    shadowColor:Colors.black,
                    elevation:5,
                    child: Container(
                      width: width*0.28,
                      height: width*0.28,
                      // color: Colors.red,
                      child: Stack(
                        children: [

                          ///counter
                          Align(
                            alignment: Alignment(-0.9,-0.8),
                            child: Text("$initial_count_upcoming",style: TextStyle(fontSize:width*0.04,fontWeight: customstheam.h1_weight),),
                          ),
                          Align(
                              alignment: Alignment(-0.1, 0.4),
                              child: IntrinsicHeight(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      ///TODO: GIVE PADDING According to Width of screen make sure to check the screen in ipad pro
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Upcoming",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Due",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Align(
                            alignment: Alignment(-0.7, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.1 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.1, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.03 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///Add Repair phone
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddRepairPhone(),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    shadowColor:Colors.black,
                    elevation: 5,
                    child: Container(
                      width: width*0.28,
                      height: width*0.28,
                      // color: Colors.red,
                      child: Stack(
                        children: [
                          ///icon of add
                          Align(
                            alignment: Alignment(-0.9,-0.8),
                            child: Icon(Icons.add,color: customstheam.icon_col,size: width*0.065,)
                          ),
                          Align(
                              alignment: Alignment(-0.1, 0.4),
                              child: IntrinsicHeight(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Add Repair",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Phone",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Align(
                            alignment: Alignment(-0.7, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.1 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.1, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.03 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ///Download Report
                InkWell(
                  onTap: (){
                    setState(() {
                      heading_text="Download Report";
                      selected_card=6;
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side:selected_card==6? BorderSide(color: customstheam.icon_col,width: 1):BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8)),
                    color: Colors.white,
                    shadowColor:Colors.black,
                    elevation: 5,
                    child: Container(
                      width: width*0.28,
                      height: width*0.28,
                      // color: Colors.red,
                      child: Stack(
                        children: [

                          ///download icon
                          Align(
                            alignment: Alignment(-0.9,-0.8),
                            child: Icon(Icons.download_for_offline,color: customstheam.icon_col,size: width*0.065,)
                          ),
                          Align(
                              alignment: Alignment(-0.1, 0.4),
                              child: IntrinsicHeight(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      ///TODO: GIVE PADDING According to Width of screen make sure to check the screen in ipad pro
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Download",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold),)
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: width*0.02),
                                      child: Row(
                                        children: [
                                          Text("Report",style: TextStyle(fontSize:width*0.035,fontWeight:FontWeight.bold,color: customstheam.icon_col))
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          ),
                          Align(
                            alignment: Alignment(-0.7, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.1 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.1, 0.8),
                            child: Container(
                              height: height*0.007,
                              width:width*0.03 ,
                              decoration: BoxDecoration(
                                color: customstheam.icon_col,
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.01,),

            Text("$heading_text",style: TextStyle(fontSize: customstheam.h1,fontWeight: FontWeight.bold),),
            selected_card!=6?Column(
              children: [
                Container(
                  // color: Colors.red,
                  alignment: Alignment.topCenter,
                  child: Lottie.asset('assets/images/notfound.json',height: height*0.33),
                ),
                Center(child: Text("No Data Found!",style: TextStyle(fontSize: customstheam.h1,fontWeight: customstheam.h1_weight),)),
              ],
            ):SizedBox.shrink(),
            selected_card==6?Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 18),

                  // Start Date
                  _buildDateRow("Start Date", _startDate, () => _sDate(context)),
                  SizedBox(height: 8),

                  // End Date
                  _buildDateRow("End Date", _endDate, () => _eDate(context)),
                  SizedBox(height: 8),

                  // Type Dropdown
                  _buildDropdownRow(
                    "Sim Company",
                    _selectedType,
                    ['All','Delivered', 'Upcoming'],
                        (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                  SizedBox(height: 32),

                  // Download Button
                  Container(width: width*0.6,
                    child: ElevatedButton(
                      onPressed: _isDownloadButtonEnabled ? () {} : (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:customstheam.icon_col,
                        // padding: EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Download Report',
                        maxLines: 1,
                        style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ],
              ),
            ):SizedBox.shrink(),



          ],
        ),
      ),
    );

  }
  Widget _buildDateRow(String label, DateTime? date, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
          TextStyle(fontSize: customstheam.h1, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40,
            width: 180,
            decoration: BoxDecoration(
              border: Border.all(
                color: customstheam.icon_col,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Text(
                date != null
                    ? "${date.day}/${date.month}/${date.year}"
                    : 'Select',
                style: TextStyle(
                    fontSize: customstheam.h1,
                    color: Colors.black,
                    fontWeight: customstheam.h1_weight),
              ),
            ),
          ),
        )
      ],
    );
  }
  Widget _buildDropdownRow(
      String label, String currentValue, List<String> options, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
          TextStyle(fontSize: customstheam.h1, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 50,
          width: 180,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: customstheam.icon_col,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: DropdownButton<String>(
            value: currentValue,
            isExpanded: true,
            underline: SizedBox(),
            icon:SizedBox.shrink(),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Center(
                  child: Text(
                    option,
                    style: TextStyle(
                        fontSize: customstheam.h1,
                        fontWeight: customstheam.h1_weight),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}


