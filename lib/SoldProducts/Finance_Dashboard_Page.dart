import 'package:flutter/material.dart';
import '../customfolder/custom_things.dart';

class FinanceDashboardPage extends StatefulWidget {
  const FinanceDashboardPage({super.key});

  @override
  State<FinanceDashboardPage> createState() => _FinanceDashboardPageState();
}

class _FinanceDashboardPageState extends State<FinanceDashboardPage> {
  int _counter_Total_Finance = 0;
  int _counter_Total_Received = 0;
  int _counter_Total_Pending = 0;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customstheam.bgfinance,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Finance Dashboard',
          style: TextStyle(fontSize: 18),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Finance Overview Section
            Container(
              color: customstheam.bgfinance,
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Total Finance
                        Expanded(child: _buildFinanceColumn("$_counter_Total_Finance", "Total Finance", Colors.blue)),
                        _buildVisibleDivider(),

                        // Total Received
                        Expanded(child: _buildFinanceColumn("$_counter_Total_Received", "Total Received", Colors.green)),
                        _buildVisibleDivider(),

                        // Total Pending
                        Expanded(child: _buildFinanceColumn("$_counter_Total_Pending", "Total Pending", Colors.red)),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Finance Details Title
            Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 18, right: 18),
              child: Row(
                children: [
                  Text("Finance Details", style: TextStyle(fontSize: 22)),
                ],
              ),
            ),

            // Add more widgets for detailed content here
          ],
        ),
      ),
    );
  }

  /// Finance Info Column
  Widget _buildFinanceColumn(String value, String label, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }

  /// Visible Divider
  Widget _buildVisibleDivider() {
    return VerticalDivider(
      color: customstheam.line_col,
      thickness: 2,
      width: 20,
      indent: 1,   // Space from the top
      endIndent: 1, // Space from the bottom
    );
  }
}









