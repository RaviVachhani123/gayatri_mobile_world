
import 'package:flutter/material.dart';
import 'package:gayatri_mobile_world/customfolder/custom_things.dart';

class SelectCityScreen extends StatefulWidget {
  @override
  _SelectCityScreenState createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  List<String> cities = [
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Hyderabad",
    "Ahmedabad",
    "Chennai",
    "Kolkata",
    "Surat",
    "Pune",
    "Jaipur",
    "Lucknow",
    "Kanpur",
  ];

  List<String> filteredCities = [];

  @override
  void initState() {
    super.initState();
    filteredCities = cities; // Initially display all cities
  }

  void _filterCities(String query) {
    setState(() {
      filteredCities = cities
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
// class SelectCityScreen extends StatefulWidget {
//   final String selectedState;
//
//   SelectCityScreen({required this.selectedState});
//
//   @override
//   _SelectCityScreenState createState() => _SelectCityScreenState();
// }
//
// class _SelectCityScreenState extends State<SelectCityScreen> {
//   TextEditingController searchController = TextEditingController();
//   String? selectedCity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select City'),
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
//                 hintText: 'Search City',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16.0),
//                 ),
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           // CSC Picker for City Selection
//           Expanded(
//             child: CSCPicker(
//               showStates: false,
//               showCities: true,
//               // countryFilter: CscCountry.India, // Restrict to India
//               onCityChanged: (value) {
//                 setState(() {
//                   selectedCity = value;
//                 });
//                 if (value != null) {
//                   Navigator.pop(context, value);
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
