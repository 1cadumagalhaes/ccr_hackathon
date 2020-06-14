import 'package:caminhoes_app/widgets/render_stars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlaceScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;
  PlaceScreen( this.snapshot);


  @override
  Widget build(BuildContext context) {
      var data = snapshot.data;
      var type = data['type'];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text(type),
              centerTitle: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text("Informações"),
                  ),
                  Tab(
                    child: Text("Comentários"),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                InfoTab(data),
                Container(color: Colors.blue,)
              ],
            )));
  }
}

class InfoTab extends StatelessWidget {
  
  final data;
  InfoTab(this.data);

 

  @override
  Widget build(BuildContext context) {
     var image = data['image'], name=data['name'], grade=data['grade'], address=data['address'], phone = data['phone'];
     var featuresList = data['features'].map((item)=>item.toString()).toList();
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
                        fit: BoxFit.cover,
                        image: NetworkImage('$image')),
                    color: Colors.grey),
              ),
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(
                    fontSize: 32, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              FeatureIcons(featuresList, 2),
              SizedBox(height: 8),
              RenderStars(grade, 22),
              SizedBox(height: 8),
              Container(child:IconRow(
                  icon: Icons.place,
                  text: address,
                  size: 18)),
              SizedBox(height: 8),
              IconRow(
                  icon: Icons.phone,
                  text: phone,
                  size: 18),
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
    return InkWell(
      onTap: (){
        if(icon==Icons.phone){
          launch("tel:$text");
        }
      },
      child: Row(
      children: [
        Icon(icon, size: size != null ? size + 8 : 16 + 8),
        SizedBox(width: 8),
        Container(
              child: Flexible(child: Text(text,style: TextStyle(fontSize: size != null ? size : 16),),
            )
        )
      ],
    ),
    );
  }
}

class FeatureIcons extends StatelessWidget {
  //wc, bathtub, hotel, restaurant, local_parking, wifi, local_gas_station

  final List<dynamic> featuresList;
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
