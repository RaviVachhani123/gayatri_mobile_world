import 'package:flutter/material.dart';

class SelectStateScreen extends StatelessWidget {
  final List<String> states = ['Gujarat', 'New Delhi', 'Bihar'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select State')),
      body: ListView.builder(
        itemCount: states.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(states[index]),
            onTap: () {
              Navigator.pop(context, states[index]);
            },
          );
        },
      ),
    );
  }
}
