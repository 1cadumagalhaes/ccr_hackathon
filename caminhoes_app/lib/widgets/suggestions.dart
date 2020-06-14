import 'package:flutter/material.dart';

class SuggestionsCard extends StatelessWidget {
  
  final name, description;

  SuggestionsCard({ @required this.name, @required this.description });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container (
        width: 400,
        child: Column (
          children: [
                Row(
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '$description',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ]),
          )
    );
  }
}