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
            title: Text('Caminhoneiros'),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal:16,vertical:16), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Olá, nome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ,),
                HealthCard()
              ],
            )
          ),
        )
      ],
    );
  }
}

class HealthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange,
      child: Container(

        padding: EdgeInsets.all(16),
        width: 400,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Você está em:", style: TextStyle(fontSize: 16,)),
            SizedBox(height: 4,),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 16,),
                    Icon(Icons.my_location),
                    SizedBox(width: 16),
                    Text("Rodovia BR XXX, km Y", style: TextStyle(fontSize: 18))
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  children: [
                    Text("Hoje você já dirigiu ", style: TextStyle(fontSize: 18)),
                    Text("9 horas", style: TextStyle(color: Colors.red, fontSize: 18),)

                  ],
                ),
                SizedBox(height: 16,),
                Text("A última parada para descanso faz 5 horas. ", style: TextStyle(fontSize: 18)),
                Text("Você precisa parar na próxima parada ", style: TextStyle(fontSize: 16, color: Colors.red)),
                
              ],
            ),
          ]
        ),
      ),
    );
  }
}
