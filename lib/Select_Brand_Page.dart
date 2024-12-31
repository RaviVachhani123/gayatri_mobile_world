import 'package:flutter/material.dart';

class SelectBrandScreen extends StatelessWidget {
  final List<String> brands = ['Mi', 'Vivo', 'Apple'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Brand')),
      body: ListView.builder(
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(brands[index]),
            onTap: () {
              Navigator.pop(context, brands[index]);
            },
          );
        },
      ),
    );
  }
}
