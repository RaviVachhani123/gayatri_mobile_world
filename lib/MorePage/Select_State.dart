import 'dart:convert';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:gayatri_mobile_world/AppThemes/TextThemes.dart';
import 'package:gayatri_mobile_world/customfolder/InputDecoration.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';
// import 'package:gayatrimobileworld/AppThemes/AppColors.dart';
// import 'package:gayatrimobileworld/AppThemes/InputFieldDecoration.dart';
// import 'package:gayatrimobileworld/AppThemes/TextThemes.dart';
// import 'package:gayatrimobileworld/customfolder/InputDecoration.dart';
// import 'package:gayatrimobileworld/customfolder/custom_things.dart';

class SelectStateOfIndia extends StatefulWidget {
  TextEditingController statecontroller;
  TextEditingController citycontroller;
  bool iscitypicker;
  SelectStateOfIndia({required this.statecontroller, required this.iscitypicker ,required this.citycontroller ,super.key});

  @override
  State<SelectStateOfIndia> createState() => _SelectStateOfIndiaState();
}

class _SelectStateOfIndiaState extends State<SelectStateOfIndia> {
  List<String> _allStates = [];
  List<String> _filteredStates = [];
  List<String> _cities = [];
  List<String> _filteredCities = [];
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loadStatesFromAssets();
    _searchController.addListener(_filterStates);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterStates() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      widget.iscitypicker?
      _filteredCities = _cities.where((state) => state.toLowerCase().contains(query)).toList()
          :
      _filteredStates = _allStates.where((state) => state.toLowerCase().contains(query)).toList();
    });
  }
  Future<void> loadStatesFromAssets() async {
    final String response = await rootBundle.loadString('assets/JsonData/StateAndCity.json');
    final Map<String, dynamic> data = jsonDecode(response);

    if (widget.iscitypicker) {
      String selectedState = widget.statecontroller.text;
      Map<String, dynamic>? stateData = data['State'].firstWhere(
            (item) => item['name'] == selectedState,
        orElse: () => null,
      );

      if (stateData != null && stateData.containsKey('cities')) {
        List<String> cities = List<String>.from(stateData['cities']);
        setState(() {
          _cities = cities;
          _filteredCities = cities;
        });
      }
    } else {
      List<String> states = List<String>.from(data['State'].map((item) => item['name'] as String));
      setState(() {
        _allStates = states;
        _filteredStates = states;
      });
    }
    // List<String> states = List<String>.from(data['State'].map((item) => item['name'] as String));
    //
    // setState(() {
    //   _allStates = states;
    //   _filteredStates = states;
    // });
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.15,
        backgroundColor: AppColors.primarycolor,
        surfaceTintColor: AppColors.primarycolor,
        title: CustomizedText(
          text: "Search",
          size: customstheam.text_responsive18,
          weight: TextSizes.Medium_text,
          color: AppColors.bgcolor,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(
          color: AppColors.bgcolor,
          size: width * 0.06,
        ),
      ),
      body: Container(
          height: height,
          width: width,
          child: Padding(
            padding: EdgeInsets.all(width * 0.04),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(
                    fontSize: TextSizes.Heading_2,
                  ),
                  controller: _searchController,
                  // controller: controller,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: AppColors.textcolor.withOpacity(0.3),
                        fontSize: TextSizes.Heading_2,
                      ),
                      border: CustomInputDecoration.CustomDeco(context),
                      enabledBorder: CustomInputDecoration.CustomDeco(context),
                      disabledBorder: CustomInputDecoration.CustomDeco(context),
                      errorBorder: CustomInputDecoration.CustomDeco(context),
                      focusedBorder: CustomInputDecoration.CustomDeco(context),
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: width * 0.04,vertical: width*0.02)),
                ),
                SizedBox(height: height*0.0095,),
                Expanded(
                  child: (widget.iscitypicker ? _filteredCities : _filteredStates).isEmpty
                      ? Center(
                    child: Text(
                      widget.iscitypicker ? "No cities found" : "No states found",
                    ),
                  )
                      : ListView.builder(
                    itemCount: widget.iscitypicker
                        ? _filteredCities.length
                        : _filteredStates.length,
                    itemBuilder: (context, index) {
                      final displayText = widget.iscitypicker
                          ? _filteredCities[index]
                          : _filteredStates[index];

                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (widget.iscitypicker) {
                              widget.citycontroller.text = displayText;
                            } else {
                              widget.statecontroller.text = displayText;
                              widget.citycontroller.clear();
                            }
                          });
                          Navigator.pop(context);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: height * 0.07,
                            width: width,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: width*0.02),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primarycolor,
                                width: width * 0.0025,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.primarycolor.withOpacity(0.3),
                            ),
                            child: CustomizedText(
                              text: displayText,
                              size: TextSizes.Heading_2,
                              weight: TextSizes.normal_text,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }

// Future<List<String>> loadStatesFromAssets() async {
//   final String response =
//       await rootBundle.loadString('Assets/JsonData/StateAndCity.json');
//   // print(response);
//   final Map<String, dynamic> data = jsonDecode(response);
//   print(data["State"].map((item) => item['name'] as String));
//   List<String> states =
//       List<String>.from(data['State'].map((item) => item['name'] as String));
//   print(states);
//   return states;
// }
}


