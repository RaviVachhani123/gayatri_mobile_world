import 'package:flutter/material.dart';

class SelectCityScreen extends StatelessWidget {
  final List<String> cities = ['Rajkot', 'Delhi', 'Patna'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select City')),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              Navigator.pop(context, cities[index]);
            },
          );
        },
      ),
    );
  }
}
