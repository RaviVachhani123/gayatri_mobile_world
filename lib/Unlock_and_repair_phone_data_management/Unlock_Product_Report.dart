
import 'package:flutter/material.dart';
import '../customfolder/custom_things.dart';

class DownloadUnlockPhoneDataPage extends StatefulWidget {
  const DownloadUnlockPhoneDataPage({super.key});

  @override
  State<DownloadUnlockPhoneDataPage> createState() => _DownloadUnlockPhoneDataPageState();
}

class _DownloadUnlockPhoneDataPageState extends State<DownloadUnlockPhoneDataPage> {
  DateTime? _startDate;
  DateTime? _endDate;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Download Unlock Phone Data',
          style: TextStyle(fontSize:18),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [


              // Start Date
              _buildDateRow("Start Date", _startDate, () => _sDate(context)),
              SizedBox(height: 8),

              // End Date
              _buildDateRow("End Date", _endDate, () => _eDate(context)),

              SizedBox(height: 32),

              // Download Button
              ElevatedButton(
                onPressed:  (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: customstheam.icon_col,
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
}
