import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(

        padding: EdgeInsets.all(16),
        width: 400,
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
                SizedBox(height: 16,),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text('Quando parar, temos algumas sugestões de atividades para você.', style: TextStyle(fontSize: 16),),
                        RaisedButton(onPressed: (){}, child: Text('Saiba mais'), color: Theme.of(context).primaryColor,)
                      ],
                    )
                  ),
                )
              ],
            ),
          ]
        ),
      ),
    );
  }
}