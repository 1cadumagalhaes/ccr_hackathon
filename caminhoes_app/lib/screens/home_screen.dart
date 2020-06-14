import 'package:caminhoes_app/tabs/home_tab.dart';
import 'package:caminhoes_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

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
          body: HomeTab()
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Lugares'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.pink,),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Saúde'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.yellow,),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Segurança'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.lightGreen,),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('Faça uma denúncia'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(color: Colors.lightBlue,),
        ),

      ],
    );
  }
}
