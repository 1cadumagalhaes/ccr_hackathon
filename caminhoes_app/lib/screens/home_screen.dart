
import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/screens/login_screen.dart';
import 'package:caminhoes_app/tabs/complaint_tab.dart';
import 'package:caminhoes_app/tabs/health_tab.dart';
import 'package:caminhoes_app/tabs/home_tab.dart';
import 'package:caminhoes_app/tabs/places_tab.dart';
import 'package:caminhoes_app/tabs/security_tab.dart';
import 'package:caminhoes_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    //getLocation();
    if(UserModel.of(context).isLoading && UserModel.of(context).isLoggedIn())
      return Center(child: CircularProgressIndicator());
    else if(!UserModel.of(context).isLoggedIn())
      return LoginScreen(); 
    else 
    return HomeLogada(pageController: _pageController, );
  }
}

class HomeLogada extends StatelessWidget {
  const HomeLogada({
    Key key,
    @required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
            appBar: AppBar(
              title: Text('Sua viagem'),
              centerTitle: true,
            ),
            drawer: CustomDrawer(_pageController),
            body: HomeTab(pageController: _pageController)),
        Scaffold(
          appBar: AppBar(
            title: Text('Lugares'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: PlacesTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Saúde'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: HealthTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Segurança'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: SecurityTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Faça uma denúncia'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ComplaintTab(),
        ),
      ],
    );
  }
}
