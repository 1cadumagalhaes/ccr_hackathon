import 'package:caminhoes_app/models/location_model.dart';
import 'package:caminhoes_app/tiles/place_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class PlacesTab extends StatelessWidget {
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
                    tiles: snapshot.data.documents.map((doc)=>PlaceTile(doc)).toList(),
                    color: Theme.of(context).accentColor).toList();
                return ListView(children: placesTiles,);
              }
            });
        
      },
    );
  }
}
