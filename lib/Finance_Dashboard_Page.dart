import 'package:flutter/material.dart';

import 'customfolder/custom_things.dart';
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
    final double height= MediaQuery.sizeOf(context).height;
    final double width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:customstheam.bgfinance,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Finance dashboard',
          style: TextStyle(fontSize: 24),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                color: customstheam.bgfinance,
                width: width,
                height: height*0.11,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        //Total Finance
                        Column(
                          children: [
                            Text("$_counter_Total_Finance",style: TextStyle(color: Colors.blue,fontSize: 24,fontWeight: FontWeight.bold),),
                            Text("Total Finance",style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        VerticalDivider(color: customstheam.line_col,thickness:2,width: 20,),

                        //Total Received
                        Column(
                          children: [
                            Text("$_counter_Total_Received",style: TextStyle(color: Colors.green,fontSize: 24,fontWeight: FontWeight.bold),),
                            Text("Total Received",style: TextStyle(fontSize: 15),)
                          ],
                        ),
                        VerticalDivider(color: customstheam.line_col,thickness: 2,width: 20,),

                        //Total Pending
                        Column(
                          children: [
                            Text("$_counter_Total_Pending",style: TextStyle(color: Colors.red,fontSize: 24,fontWeight: FontWeight.bold),),
                            Text("Total Pending",style: TextStyle(fontSize: 15),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0,left: 18,right: 18),
                child: Row(
                  children: [
                    Text("Finance Details",style: TextStyle(fontSize: 22),),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
