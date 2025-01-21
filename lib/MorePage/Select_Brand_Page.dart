import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/AppThemes/AppColors.dart';
import 'package:gayatri_mobile_world/AppThemes/TextThemes.dart';
import 'package:gayatri_mobile_world/customfolder/InputDecoration.dart';
// import 'package:gayatrimobileworld/AppThemes/AppColors.dart';
// import 'package:gayatrimobileworld/AppThemes/TextThemes.dart';
// import 'package:gayatrimobileworld/customfolder/InputDecoration.dart';

import '../customfolder/custom_things.dart';

class SelectBrandScreen extends StatefulWidget {
  @override
  _SelectBrandScreenState createState() => _SelectBrandScreenState();
}

class _SelectBrandScreenState extends State<SelectBrandScreen> {
  List<String>  states= [
    "Apple",
    "Samsung",
    "MI",
    "Oppo",
    "Vivo",
    "Google",
    "One Plus",
    "Motorola",
    "LG",
    "Huawei",
    "Tecno",
    "Poco",
    "Realme",
    "Nokia",
    "Other",
    "Itel",
    "Infinix",
    "Nothing",
  ];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = states; // Initially display all cities
  }

  void _filterCities(String query) {
    setState(() {
      filteredCities = states
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
      body: Column(
        children: [
          Padding(
            padding:EdgeInsets.symmetric(horizontal: width*0.04,vertical: width*0.01),
            child: TextField(
              onChanged: _filterCities,
              style: TextStyle(
                fontSize: TextSizes.Heading_2,
              ),
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
                  EdgeInsets.symmetric(horizontal: width * 0.04,vertical: width*0.02)
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Return the selected city to the previous screen
                    Navigator.pop(context, filteredCities[index]);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.04),
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
                            color: customstheam.icon_col,
                            width: width * 0.0025,
                          ),
                          color:  customstheam.icon_col.withOpacity(0.3), // Light green background
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child:Text(
                          (filteredCities[index]),
                          style:TextStyle(fontSize:customstheam.text_responsive ) ,

                        ),

                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}





// import 'package:flutter/material.dart';
//
// import '../customfolder/custom_things.dart';
//
// class SelectBrandScreen extends StatefulWidget {
//   @override
//   _SelectBrandScreenState createState() => _SelectBrandScreenState();
// }
//
// class _SelectBrandScreenState extends State<SelectBrandScreen> {
//   List<String>  states= [
//     "Apple",
//     "Samsung",
//     "MI",
//     "Oppo",
//     "Vivo",
//     "Google",
//     "One Plus",
//     "Motorola",
//     "LG",
//     "Huawei",
//     "Tecno",
//     "Poco",
//     "Realme",
//     "Nokia",
//     "Other",
//     "Itel",
//     "Infinix",
//     "Nothing",
//   ];
//
//   List<String> filteredCities = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredCities = states; // Initially display all cities
//   }
//
//   void _filterCities(String query) {
//     setState(() {
//       filteredCities = states
//           .where((city) => city.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor:Color(0xFF17A589),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Search',
//           style: TextStyle(fontSize: 18,color: Colors.white),
//         ),
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               onChanged: _filterCities,
//               decoration: InputDecoration(
//                 hintText: "Search",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(color: Color(0xFF17A589), width: 20),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                   borderSide: BorderSide(color: Color(0xFF17A589)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredCities.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Return the selected city to the previous screen
//                     Navigator.pop(context, filteredCities[index]);
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(
//                         vertical: 4.0, horizontal: 12.0),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFE8F6F3), // Light green background
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: ListTile(
//                       title: Text(filteredCities[index]),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
