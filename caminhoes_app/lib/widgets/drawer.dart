import 'package:caminhoes_app/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  
  final PageController pageController;

  CustomDrawer(this.pageController);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
        
        children: [
          Container(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.android, size: 100),
                Text(
                  "Nome da pessoa",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "X",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      " viagens",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      "  x,x",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Icon(Icons.star, size: 14)
                  ],
                )
              ],

              ),
            ),
            SizedBox(
              height: 20
            ),
          DrawerTile(Icons.directions, 'Sua viagem', pageController, 0),
          DrawerTile(Icons.group, 'Amigos', pageController, 1),
          DrawerTile(Icons.pin_drop, 'Encontre lugares', pageController, 2),
          DrawerTile(Icons.accessibility, 'Saúde', pageController, 3),
          DrawerTile(Icons.build, 'Manutenção', pageController, 4),
          DrawerTile(Icons.security, 'Segurança', pageController, 5),
          DrawerTile(Icons.monetization_on, 'Frete', pageController, 6),
          DrawerTile(Icons.rss_feed, 'Notícias', pageController, 7),
          DrawerTile(Icons.warning, 'Faça uma denúncia', pageController, 8),
          Divider(thickness: 2,),
          DrawerTile(Icons.settings, 'Configurações', pageController, 9),
        ],
      ),
      )
    );
  }
}
