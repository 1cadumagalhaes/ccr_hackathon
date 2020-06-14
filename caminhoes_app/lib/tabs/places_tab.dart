import 'package:caminhoes_app/widgets/render_stars.dart';
import 'package:flutter/material.dart';

class PlacesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 400,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage('${""}')),
                    color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                'Nome do lugar',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              FeatureIcons([
                  'wc',
                  'bathroom',
                  'hotel',
                  'restaurant',
                  'local_parking',
                  'wifi',
                  'local_gas_station',
                  'hot_tub'
                ], 2),
              SizedBox(height: 8),
                RenderStars(3.5, 22),
              SizedBox(height: 8),
              IconRow(icon: Icons.place, text: "Endereço do lugar", size: 18),
              SizedBox(height: 8),
              IconRow(icon: Icons.phone, text: "(XX) XXXX-XXXX", size: 18),
            ],
          ),
        )
      ],
    );
  }
}

class IconRow extends StatelessWidget {
  final icon;
  final text;
  final double size;
  IconRow({@required this.icon, @required this.text, this.size});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: size != null ? size + 8 : 16 + 8),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(fontSize: size != null ? size : 16),
        ),
      ],
    );
  }
}

class FeatureIcons extends StatelessWidget {
  //wc, bathtub, hotel, restaurant, local_parking, wifi, local_gas_station

  final List<String> featuresList;
  final double space;
  FeatureIcons(this.featuresList, this.space);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];

    var test = [
      {"name": 'wc', "icon": Icons.wc},
      {"name": 'hot_tub', "icon": Icons.hot_tub},
      {"name": 'hotel', "icon": Icons.hotel},
      {"name": 'restaurant', "icon": Icons.restaurant},
      {"name": 'local_parking', "icon": Icons.local_parking},
      {"name": 'wifi', "icon": Icons.wifi},
      {"name": 'local_gas_station', "icon": Icons.local_gas_station}
    ];

    test.forEach((element) {
      if (featuresList.contains(element['name'])) {
        list.add(Icon(
          element['icon'],
          color: Theme.of(context).primaryColor,
        ));
        list.add(
          SizedBox(width: space),
        );
      }
    });

    return Row(children: list);
  }
}
