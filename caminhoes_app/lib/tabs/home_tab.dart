import 'package:caminhoes_app/widgets/health_card.dart';
import 'package:caminhoes_app/widgets/nearby_card.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      return ListView(children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Olá, nome",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                HealthCard(),
                SizedBox(
                  height: 20,
                ),
                NearbyCard()
              ],
            ))
      ]);
  }
}
