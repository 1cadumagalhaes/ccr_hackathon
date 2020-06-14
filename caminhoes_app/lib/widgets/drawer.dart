import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Theme.of(context).primaryColor,
      child: !UserModel.of(context).isLoggedIn()?MenuLogado(pageController: pageController):null,
    ));
  }
}

class MenuLogado extends StatelessWidget {
  const MenuLogado({
    Key key,
    @required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.only(top: 40, bottom: 20),
          child: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://immedilet-invest.com/wp-content/uploads/2016/01/user-placeholder.jpg'),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image:DecorationImage(fit: BoxFit.cover, image: NetworkImage(model.isLoggedIn()?model.userData['image']:'https://ceulaw.org.br/wp-content/uploads/2017/08/user-placeholder.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                    ),
                  ),
                  SizedBox(height:8),
                  Text("${model.isLoggedIn()?model.userData['name']:'Nome do usuário'}", style: TextStyle(fontSize: 18, color: Colors.white),),
                  SizedBox(height:8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${model.isLoggedIn()?model.userData['trips']:'X'}", style: TextStyle(color: Colors.white),),
                      Text("  viagens   |   "),
                      Text("${model.isLoggedIn()?model.userData['rate']:'X.X'}", style: TextStyle(color: Colors.white),),
                      Icon(Icons.star, size: 14, color: Colors.white,)
                    ],
                  )
                ],
              );
            },
          )
        ),
        SizedBox(height: 20),
        DrawerTile(Icons.directions, 'Sua viagem', pageController, 0),
        //DrawerTile(Icons.group, 'Amigos', pageController, 1),
        DrawerTile(Icons.pin_drop, 'Encontre lugares', pageController, 1),
        DrawerTile(Icons.accessibility, 'Saúde', pageController, 2),
        //DrawerTile(Icons.build, 'Manutenção', pageController, 4),
        DrawerTile(Icons.security, 'Segurança', pageController, 3),
        //DrawerTile(Icons.monetization_on, 'Frete', pageController, 6),
        //DrawerTile(Icons.rss_feed, 'Notícias', pageController, 7),
        DrawerTile(Icons.warning, 'Faça uma denúncia', pageController, 4),
        //Divider(thickness: 2,),
        //DrawerTile(Icons.settings, 'Configurações', pageController, 5),
      ],
    );
  }
}
