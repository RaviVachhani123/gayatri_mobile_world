import 'package:flutter/material.dart';

import 'customfolder/custom_things.dart';

class SimCardHistoryPage extends StatefulWidget {
  const SimCardHistoryPage({super.key});

  @override
  State<SimCardHistoryPage> createState() => _SimCardHistoryPageState();
}

class _SimCardHistoryPageState extends State<SimCardHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red ,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customstheam.icon_col),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sim card history',
          style: TextStyle(fontSize: 24),
        ),
        actions: [

          InkWell(
            onTap: (){
              AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("hello"),
                    SizedBox(height: 10),
                    Divider(thickness: 1, color: Colors.grey,), // Horizontal line
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        minimumSize: Size(100, 30), // Width and height for button
                      ),
                      child: Text(
                        'OKAY',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.filter_alt_sharp,color: customstheam.icon_col,),
            ),
          ),
        ],
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",hintStyle: TextStyle(fontSize: customstheam.h1),
                enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: customstheam.icon_col,width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: customstheam.icon_col),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: customstheam.icon_col),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              )
            ),
          )
        ],
      ),
    );
  }
}
