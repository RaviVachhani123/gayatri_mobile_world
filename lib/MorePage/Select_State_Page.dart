
import 'package:flutter/material.dart';

import '../customfolder/custom_things.dart';

class SelectStateScreen extends StatefulWidget {
  @override
  _SelectStateScreenState createState() => _SelectStateScreenState();
}

class _SelectStateScreenState extends State<SelectStateScreen> {
  List<String>  states= [
    "Andaman and Nicobar Islands",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chandigarh",
    "Chhattisgarh",
    "Dadra and Nagar Haveli",
    "Daman and Diu",
    "Delhi",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jammu and Kashmir",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Ladakh",
    "Lakshadweep",
    "Madhya Pradesh",
    "Maharashtra",
    "Mainipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Puducherry",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarkhand",
    "West Bengal",
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:Color(0xFF17A589),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Search',
          style: TextStyle(fontSize: 18,color: Colors.white),
        ),

        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              onChanged: _filterCities,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xFF17A589), width: 20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFF17A589)),
                ),
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
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 12.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8F6F3), // Light green background
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      title: Text(filteredCities[index]),
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
// import 'package:csc_picker/csc_picker.dart';
//
// import 'Select_City_Page.dart';
//
// class SelectStateScreen extends StatefulWidget {
//   @override
//   _SelectStateScreenState createState() => _SelectStateScreenState();
// }
//
// class _SelectStateScreenState extends State<SelectStateScreen> {
//   TextEditingController searchController = TextEditingController();
//   String? selectedState;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select State'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Search Bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search State',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           // CSC Picker for State Selection
//           Expanded(
//             child: CSCPicker(
//               showCities: false,
//               showStates: true,
//               // countryFilter: CscCountry.India, // Restrict to India
//               onStateChanged: (value) {
//                 setState(() {
//                   selectedState = value;
//                 });
//                 if (value != null) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (_) => SelectCityScreen(selectedState: value),
//                     ),
//                   );
//                 }
//               },
//               dropdownDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16.0),
//                 color: Colors.lightGreen[50],
//                 border: Border.all(color: Colors.grey),
//               ),
//               disabledDropdownDecoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
