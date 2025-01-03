// import 'package:flutter/material.dart';
// import 'customfolder/custom_things.dart';
//
// class SoldProductsReportPage extends StatefulWidget {
//   const SoldProductsReportPage({super.key});
//
//   @override
//   State<SoldProductsReportPage> createState() => _SoldProductsReportPageState();
// }
//
// class _SoldProductsReportPageState extends State<SoldProductsReportPage> {
//   DateTime? _startDate;
//   DateTime? _endDate;
//
//   String _selectedWithPrice = 'Yes';
//   String _selectedType = 'All';
//
//   // Function to Show Dropdown Menu
//   Future<void> _showDropdown(
//       BuildContext context, GlobalKey key, List<String> items, Function(String) onSelect) async {
//     final RenderBox renderBox =
//     key.currentContext?.findRenderObject() as RenderBox;
//     final Offset offset = renderBox.localToGlobal(Offset.zero);
//
//     final String? selected = await showMenu<String>(
//       context: context,
//       position: RelativeRect.fromLTRB(
//         offset.dx, // Dropdown aligned horizontally
//         offset.dy + renderBox.size.height, // Below the button
//         offset.dx + renderBox.size.width, // Increased Dropdown Width
//         offset.dy,
//       ),
//       items: items
//           .map((item) => PopupMenuItem(
//
//         value: item,
//         child: SizedBox(
//           width: 140, // Dropdown Menu Item Width
//           child: Text(item),
//         ),
//       ))
//           .toList(),
//     );
//
//     if (selected != null) {
//       onSelect(selected);
//     }
//   }
//
//   // Date Pickers
//   Future<void> _sDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _startDate = pickedDate;
//       });
//     } else {
//       setState(() {
//         _startDate = null;
//       });
//     }
//   }
//
//   Future<void> _eDate(BuildContext context) async {
//     final DateTime? pickedEndDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (pickedEndDate != null) {
//       setState(() {
//         _endDate = pickedEndDate;
//       });
//     } else {
//       setState(() {
//         _endDate = null;
//       });
//     }
//   }
//
//   // Keys for Dropdown Buttons
//   final GlobalKey _withPriceKey = GlobalKey();
//   final GlobalKey _typeKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Sold Products Report',
//           style: TextStyle(fontSize: 24),
//         ),
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 18),
//
//           // Start Date
//           _buildDateRow("Start Date", _startDate, () => _sDate(context)),
//
//           // End Date
//           _buildDateRow("End Date", _endDate, () => _eDate(context)),
//
//           // Type Dropdown
//           _buildDropdownRow(
//             label: "Type",
//             value: _selectedType,
//             key: _typeKey,
//             items: ["All", "New", "Old"],
//             onSelected: (value) {
//               setState(() {
//                 _selectedType = value;
//               });
//             },
//           ),
//
//           // With Price Dropdown
//           _buildDropdownRow(
//             label: "With Price",
//             value: _selectedWithPrice,
//             key: _withPriceKey,
//             items: ["Yes", "No"],
//             onSelected: (value) {
//               setState(() {
//                 _selectedWithPrice = value;
//               });
//             },
//           ),
//
//           SizedBox(height: 6),
//         ],
//       ),
//     );
//   }
//
//   // Date Row Widget
//   Widget _buildDateRow(String label, DateTime? date, VoidCallback onTap) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: 17, fontWeight: customstheam.h1_weight)),
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               height: 40,
//               width: 180,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: customstheam.icon_col,
//                   width: 1.0,
//                 ),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Center(
//                 child: Text(
//                   date != null
//                       ? "${date.day}/${date.month}/${date.year}"
//                       : 'Select',
//                   style: TextStyle(
//                       fontSize: customstheam.h1,
//                       color: Colors.black,
//                       fontWeight: customstheam.h1_weight),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Dropdown Row Widget
//   Widget _buildDropdownRow({
//     required String label,
//     required String value,
//     required GlobalKey key,
//     required List<String> items,
//     required Function(String) onSelected,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label,
//               style: TextStyle(
//                   fontSize: 17, fontWeight: customstheam.h1_weight)),
//           GestureDetector(
//             key: key,
//             onTap: () => _showDropdown(context, key, items, onSelected),
//             child: Container(
//               height: 50,
//               width: 180, // Button Size remains unchanged
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: customstheam.icon_col,
//                   width: 1.0,
//                 ),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     value,
//                     style: TextStyle(
//                         fontWeight: customstheam.h1_weight,
//                         fontSize: customstheam.h1),
//                   ),
//                   Icon(Icons.arrow_drop_down),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'customfolder/custom_things.dart';

class SoldProductsReportPage extends StatefulWidget {
  const SoldProductsReportPage({super.key});

  @override
  State<SoldProductsReportPage> createState() => _SoldProductsReportPageState();
}

class _SoldProductsReportPageState extends State<SoldProductsReportPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  String _selectedType = 'All';
  String _selectedWithPrice = 'Yes';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sold Products Report',
          style: TextStyle(fontSize: 24),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              "Type",
              _selectedType,
              ['All', 'New', 'Old'],
                  (value) {
                setState(() {
                  _selectedType = value!;
                });
              },
            ),
            SizedBox(height: 8),

            // With Price Dropdown
            _buildDropdownRow(
              "With Price",
              _selectedWithPrice,
              ['Yes', 'No'],
                  (value) {
                setState(() {
                  _selectedWithPrice = value!;
                });
              },
            ),
            SizedBox(height: 32),

            // Download Button
            ElevatedButton(
              onPressed: _isDownloadButtonEnabled ? () {} : (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: _isDownloadButtonEnabled
                    ? customstheam.icon_col
                    : Colors.grey,
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Download Report',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Date Row
  Widget _buildDateRow(String label, DateTime? date, VoidCallback onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
          TextStyle(fontSize: 17, fontWeight: customstheam.h1_weight),
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

  // Widget for Dropdown Row
  Widget _buildDropdownRow(
      String label, String currentValue, List<String> options, ValueChanged<String?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style:
          TextStyle(fontSize: 17, fontWeight: customstheam.h1_weight),
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
            icon: Icon(Icons.arrow_drop_down),
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: TextStyle(
                      fontSize: customstheam.h1,
                      fontWeight: customstheam.h1_weight),
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












// //nice
// import 'package:flutter/material.dart';
// import 'customfolder/custom_things.dart';
//
// class SoldProductsReportPage extends StatefulWidget {
//   const SoldProductsReportPage({super.key});
//
//   @override
//   State<SoldProductsReportPage> createState() => _SoldProductsReportPageState();
// }
//
// class _SoldProductsReportPageState extends State<SoldProductsReportPage> {
//   DateTime? _startDate;
//   DateTime? _endDate;
//
//   Future<void> _sDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (pickedDate != null) {
//       setState(() {
//         _startDate = pickedDate;
//       });
//     } else {
//       setState(() {
//         _startDate = null;
//       });
//     }
//   }
//
//   Future<void> _eDate(BuildContext context) async {
//     final DateTime? pickedEndDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             primaryColor: Colors.green,
//             hintColor: Colors.green,
//             colorScheme: ColorScheme.light(
//               primary: Colors.green,
//               onPrimary: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.green,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (pickedEndDate != null) {
//       setState(() {
//         _endDate = pickedEndDate;
//       });
//     } else {
//       setState(() {
//         _endDate = null;
//       });
//     }
//   }
//
//   bool get _isDownloadButtonEnabled => _startDate != null && _endDate != null;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Sold Products Report',
//           style: TextStyle(fontSize: 24),
//         ),
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             SizedBox(height: 18),
//
//             // Start Date
//             _buildDateRow("Start Date", _startDate, () => _sDate(context)),
//
//             SizedBox(height: 8),
//
//             // End Date
//             _buildDateRow("End Date", _endDate, () => _eDate(context)),
//
//             SizedBox(height: 6),
//
//             // Type
//             _buildDropdownRow("Type", "All",),
//
//             SizedBox(height: 6),
//
//             // With Price
//             _buildDropdownRow("With Price", "Yes"),
//
//             SizedBox(height: 32),
//
//             // Download Button
//             ElevatedButton(
//               onPressed: _isDownloadButtonEnabled ? () {} : (){}, // Disable if dates are not selected
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _isDownloadButtonEnabled
//                     ? customstheam.icon_col
//                     : Colors.grey, // Dynamic color change
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 'Download Report',
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Widget for Date Row
//   Widget _buildDateRow(String label, DateTime? date, VoidCallback onTap) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style:
//           TextStyle(fontSize: 17, fontWeight: customstheam.h1_weight),
//         ),
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             height: 40,
//             width: 180,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: customstheam.icon_col,
//                 width: 1.0,
//               ),
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Center(
//               child: Text(
//                 date != null
//                     ? "${date.day}/${date.month}/${date.year}"
//                     : 'Select',
//                 style: TextStyle(
//                     fontSize: customstheam.h1,
//                     color: Colors.black,
//                     fontWeight: customstheam.h1_weight),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//   // Widget for Dropdown Row
//   Widget _buildDropdownRow(String label, String value) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style:
//           TextStyle(fontSize: 17, fontWeight: customstheam.h1_weight),
//         ),
//         Container(
//           height: 50,
//           width: 180,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: customstheam.icon_col,
//               width: 1.0,
//             ),
//             borderRadius: BorderRadius.circular(12.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Text(
//                 value,
//                 style: TextStyle(
//                     fontWeight: customstheam.h1_weight,
//                     fontSize: customstheam.h1),
//               ),
//               Icon(Icons.arrow_drop_down),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
















//orignel
//
// import 'package:flutter/material.dart';
//
// import 'customfolder/custom_things.dart';
//
// class SoldProductsReportPage extends StatefulWidget {
//   const SoldProductsReportPage({super.key});
//
//   @override
//   State<SoldProductsReportPage> createState() => _SoldProductsReportPageState();
// }
//
// class _SoldProductsReportPageState extends State<SoldProductsReportPage> {
//
//   DateTime? _startDate;
//   DateTime? _endDate;
//
//   Future<void> _sDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//       if (pickedDate != null) {
//         setState(() {
//           _startDate = pickedDate;
//         });
//       } else {
//         // Reset to "Select" if Cancel is pressed
//         setState(() {
//           _startDate = null;
//         });
//       }
//     }
//
//   Future<void> _eDate(BuildContext context) async {
//     final DateTime? pickedendDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//         builder: (BuildContext context, Widget? child) {
//           return Theme(
//             data: ThemeData.light().copyWith(
//               primaryColor: Colors.green, // Header background color
//               hintColor: Colors.green, // Accent color
//               colorScheme: ColorScheme.light(
//                 primary: Colors.green, // Selected date color
//                 onPrimary: Colors.white, // Text color on selected date
//                 onSurface: Colors.black, // Default text color
//                 // surface: Color(0xFF01B393).withOpacity(1),
//               ),
//               textButtonTheme: TextButtonThemeData(
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.green, // Button text color
//                 ),
//               ),
//             ),
//             child: child!,
//           );
// }
//     );
//     if (pickedendDate != null) {
//       setState(() {
//         _endDate = pickedendDate;
//       });
//     } else {
//       // Reset to "Select" if Cancel is pressed
//       setState(() {
//         _endDate = null;
//       });
//     }
//   }
//
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: customstheam.icon_col,),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           title: Text('Sold Products Report', style: TextStyle(fontSize: 24),),
//           // centerTitle: true,
//           // backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 0,
//         ),
//         body: Column(
//           children: [
//             SizedBox(height: 18,),
//
//             //start date
//             Padding(
//               padding: const EdgeInsets.only(right: 16, left: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Start Date", style: TextStyle(
//                       fontSize: 17, fontWeight: customstheam.h1_weight),),
//                   GestureDetector(
//                     onTap: () => _sDate(context),
//                     child: Container(
//                       height: 40,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: customstheam.icon_col, // Border color
//                           width: 1.0, // Border width
//                         ),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ), // Optional: Rounded corners
//                       child: Center(
//                         child: Text(
//                           _startDate != null
//                               ? "${_startDate!.day}/${_startDate!
//                               .month}/${_startDate!.year}"
//                               : 'Select',
//                           style: TextStyle(
//                               fontSize: customstheam.h1,
//                               color: Colors.black,
//                               fontWeight: customstheam.h1_weight
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 8,),
//
//             //end date
//             Padding(
//               padding: const EdgeInsets.only(right: 16, left: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("End Date", style: TextStyle(
//                       fontSize: 17, fontWeight: customstheam.h1_weight),),
//                   GestureDetector(
//                     onTap: () => _eDate(context),
//                     child: Container(
//                       height: 40,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: customstheam.icon_col, // Border color
//                           width: 1.0, // Border width
//                         ),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ), // Optional: Rounded corners
//                       child: Center(
//                         child: Text(
//                           _endDate != null
//                               ? "${_endDate!.day}/${_endDate!.month}/${_endDate!
//                               .year}"
//                               : 'Select',
//                           style: TextStyle(
//                               fontSize: customstheam.h1,
//                               color: Colors.black,
//                               fontWeight: customstheam.h1_weight
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(height: 6,),
//
//             //type
//             Padding(
//               padding: const EdgeInsets.only(right: 16, left: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Type", style: TextStyle(
//                       fontSize: 17, fontWeight: customstheam.h1_weight),),
//
//                     Container(
//                       height: 50,
//                       width: 180,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: customstheam.icon_col, // Border color
//                           width: 1.0, // Border width
//                         ),
//                         borderRadius: BorderRadius.circular(12.0),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text("All",style: TextStyle(fontWeight: customstheam.h1_weight,fontSize: customstheam.h1),),
//                           SizedBox(width: 12,),
//                           Icon(Icons.arrow_drop_down)
//                         ],
//                       ),// Optional: Rounded corners
//                     ),
//
//                 ],
//               ),
//             ),
//             SizedBox(height: 6,),
//
//             //with price
//             Padding(
//               padding: const EdgeInsets.only(right: 16, left: 16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("With Price", style: TextStyle(
//                       fontSize: 17, fontWeight: customstheam.h1_weight),),
//                   Container(
//                     height: 50,
//                     width: 180,
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: customstheam.icon_col, // Border color
//                         width: 1.0, // Border width
//                       ),
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Text("Yes",style: TextStyle(fontWeight: customstheam.h1_weight,fontSize: customstheam.h1),),
//                         SizedBox(width: 12,),
//                         Icon(Icons.arrow_drop_down)
//                       ],
//                     ),// Optional: Rounded corners
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 32,),
//
//             ElevatedButton(
//               onPressed: () {
//
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: customstheam.icon_col,
//                 padding: EdgeInsets.symmetric(horizontal: 40, ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Text(
//                 'Download Report',
//                 style: TextStyle(color: Colors.white, fontSize:18),
//               ),
//             ),
//
//
//           ],
//         ),
//       );
//     }
//   }
//
