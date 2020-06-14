import 'package:caminhoes_app/models/location_model.dart';
import 'package:caminhoes_app/screens/place_screen.dart';
import 'package:caminhoes_app/widgets/render_stars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class PlaceTile extends StatelessWidget {
  final DocumentSnapshot snapshot;
  PlaceTile(this.snapshot);


  @override
  Widget build(BuildContext context) {
    var data = snapshot.data;
    var type = data['type'], name=data['name'], 
    position = data['position'], image=data['image'], grade=data['grade'];
    return ScopedModelDescendant<LocationModel>(
      builder: (context, child, model) {

        model.calculateDistance(position);
        var distance = model.distance;
        return TileCard(snapshot: snapshot, image: image, type: type, distance: distance, name: name, grade: grade);
      });
    
    //return TileCard(snapshot: snapshot, image: image, type: type, distance: distance, name: name, grade: grade);
  }
} 

class TileCard extends StatelessWidget {


  const TileCard({
    Key key,
    @required this.snapshot,
    @required this.image,
    @required this.type,
    @required this.distance,
    @required this.name,
    @required this.grade,
  }) : super(key: key);

  final DocumentSnapshot snapshot;
  final image;
  final type;
  final distance;
  final name;
  final grade;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PlaceScreen(snapshot)));
        },
        child: Card(
          child: Row(
            children: [
              SizedBox(
                height: 70,
                child: Container(child: Image.network(image,)),
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
                    RenderStars(grade, 14),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
