import 'package:caminhoes_app/models/location_model.dart';
import 'package:caminhoes_app/tiles/place_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class NearbyCard extends StatelessWidget {
  final position;

  const NearbyCard({Key key, this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LocationModel>(
      builder: (context, child, model) {
        return FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection("places").getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var placesTiles = ListTile.divideTiles(
                        tiles: snapshot.data.documents
                            .map((doc) => PlaceTile(doc))
                            .toList(),
                        color: Theme.of(context).accentColor)
                    .toList();
                return Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                        child: Column(
                  children: [
                    Text('Lugares próximos', style: TextStyle(fontSize: 24),),
                    Expanded(
                        child: ListView(
                      children: placesTiles,
                    ))
                  ],
                )));
              }
            });
      },
    );
  }
}
