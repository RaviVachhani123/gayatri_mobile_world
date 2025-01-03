
import 'package:flutter/material.dart';
import 'customfolder/custom_things.dart';

class DownloadReportPage extends StatefulWidget {
  const DownloadReportPage({super.key});

  @override
  State<DownloadReportPage> createState() => _DownloadReportPageState();
}

class _DownloadReportPageState extends State<DownloadReportPage> {
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Download Report',
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
              "Sim Company",
              _selectedType,
              ['All','Airtel', 'Jio','Vi','BSNL'],
                  (value) {
                setState(() {
                  _selectedType = value!;
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
