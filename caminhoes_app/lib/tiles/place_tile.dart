import 'package:caminhoes_app/widgets/render_stars.dart';
import 'package:flutter/material.dart';

class PlaceTile extends StatelessWidget {

  final type, name, distance, grade;

  PlaceTile({@required this.type, @required this.name, @required this.distance, @required this.grade});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 70,
            child: Container(color: Colors.grey),
          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(type),
                    Text(
                      ' em $distance km',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 18),
                ),
                RenderStars(grade),
              ],
            ),
          )
        ],
      ),
    );
  }
}