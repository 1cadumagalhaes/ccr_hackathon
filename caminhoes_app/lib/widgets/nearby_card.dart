
import 'package:caminhoes_app/tiles/place_tile.dart';
import 'package:flutter/material.dart';

class NearbyCard extends StatelessWidget {
  final position;

  const NearbyCard({Key key, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 400,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Próximo de você: ",
              style: TextStyle(
                fontSize: 18,
              )),
          SizedBox(
            height: 4,
          ),
          PlaceTile(type: 'Restaurante', name: 'Restaurante da rodovia', distance: 40, grade: 2.5),
          PlaceTile(type: 'Parada', name: 'Parada CCR', distance: 50, grade: 4.75),
        ]),
      ),
    );
  }
}



