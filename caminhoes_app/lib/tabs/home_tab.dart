import 'package:caminhoes_app/models/location_model.dart';
import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/widgets/health_card.dart';
import 'package:caminhoes_app/widgets/nearby_card.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scoped_model/scoped_model.dart';

class HomeTab extends StatelessWidget {
  //final UserModel user = UserModel();
  final PageController pageController;

  const HomeTab({Key key, this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return ScopedModelDescendant<LocationModel>(
        builder: (context, child, model){
          var address = model.address;
          var position = model.position;
          return HomeBody(address: address, position: position,pageController: pageController,);
        },);
  }
}

class HomeBody extends StatelessWidget {
  
  final address;
  final position;
  final PageController pageController;
  const HomeBody({
    Key key, this.address,this.position, this.pageController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Olá, ${UserModel.of(context).userData['name']}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              HealthCard(address: address, pageController: pageController,),
              SizedBox(
                height: 20,
              ),
              NearbyCard(position: position)
            ],
          ))
    ]);
  }
}
