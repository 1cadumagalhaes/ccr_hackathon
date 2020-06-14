import 'package:caminhoes_app/tiles/health_tile.dart';
import 'package:flutter/material.dart';

class HealthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: jsondata.map((category) => CategoryCard(category)).toList()
        ),
      )
    ],);
  }
}




class CategoryCard extends StatelessWidget {
  
  final category;
  CategoryCard(this.category);
  

  @override
  Widget build(BuildContext context) {
    var name = category['titulo'];
    var artigos = category['dados'];
    var icon;
    if(name=="Alimentação"){
      icon = Icons.local_dining;
    }else if(name=="Saúde emocional"){
      icon = Icons.face;
    }else if(name=="Atividade física"){
      icon = Icons.accessibility;
    }else{
      icon = Icons.add;
    }
    List<Widget> tiles = [];
    artigos.forEach((artigo) {tiles.add(HealthTile(artigo));});
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ExpansionTile(
        title: Text(name,
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700)),
        leading: Icon(
          icon,
          color: Theme.of(context).accentColor,
        ),
        children: tiles
      ),
    );
  }
}
var jsondata = [
    {
        "titulo": "Alimentação",
        "dados": [
            [
                {
                    "titulo": "Cuide da sua alimentação",
                    "tipo": "texto",
                    "conteudo": "Comer bem não tem a ver apenas com a boa forma física, mas com o bem-estar geral. Opte por um cardápio variado e equilibrado. E nem precisa ser nada mirabolante, e sim usando o que você  tem no dia a dia mesmo."
                },
                {
                    "titulo": "Cuide da sua alimentação",
                    "tipo": "texto",
                    "conteudo": "Seguem algumas dicas:\n - Alimente-se devagar\n -  Mastigue bem \n - Beba água suficiente para seu corpo \n - Consuma  frutas e verduras \n - Reduza o consumo de açúcar\n - Aposte em saladas também \n - Reduza o consumo de álcool e outras drogas."
                }
            ]
        ]
    },
    {
        "titulo": "Saúde emocional",
        "dados": [
            [
                {
                    "titulo": "Dicas de saúde emocional",
                    "tipo": "texto",
                    "conteudo": "Quando você estiver em um daqueles dias longo do trabalho ou em um problema familiar difícil, lembre-se de parar para respirar por alguns instantes. Se quiser dar uma volta para clarear os pensamentos, tudo bem. Depois você volta para resolver."
                },
                {
                    "titulo": "Respiração",
                    "tipo": "texto",
                    "conteudo": "Sabia que respirar corretamente pode   te ajudar emocionalmente?\n - Controla a ansiedade\n - Alivia o stress\n - Melhora a insônia\n - Reduz a pressão arterial\n - Diminui as dores lombares\n - E dá sensação de bem estar"
                },
                {
                    "titulo": "Exercícios de respiração",
                    "tipo": "texto",
                    "conteudo": "Para fazer um exercício de respiração você  precisa inspirar e expirar, como se você  primeiramente cheirasse um perfume e depois, como se soprasse uma vela. Você pode fazer isso sempre que quiser,  sentado no seu carro, deitado na sua cama, ou de pé em algum lugar."
                },
                {
                    "titulo": "Respiração",
                    "tipo": "texto",
                    "conteudo": "Estudos científicos comprovam que exercícios de respiração são tão eficientes quanto alguns remédios.\n\n Separe alguns minutos por dia e tente!"
                }
            ],
            [
                {
                    "titulo": "A importância do sono",
                    "tipo": "texto",
                    "conteudo": "Sempre que possível priorize o sono.\n \nNoites mal dormidas colaboram para agravar os transtornos emocionais e físicos."
                }
            ]
        ]
    },
    {
        "titulo": "Atividade física",
        "dados": [
            [
                {
                    "titulo": "Estilo de vida",
                    "tipo": "texto",
                    "conteudo": "Pessoas que ficam muito tempo sentadas durante o trabalho acabam adquirindo alguns males para a saúde,  é importante buscar melhorias e mudanças no estilo de vida.\nSegundo estudos, falta de mobilidade reduz a expectativa de vida em cerca de dois anos e aumenta a possibilidade de doenças cardíacas, diabetes e câncer."
                },
                {
                    "titulo": "Exercícios físicos",
                    "tipo": "texto",
                    "conteudo":"Por isso você  precisa de exercícios físicos:\n\n - Levante e estique as pernas.\n - Não perca a oportunidade de dar uma caminhada, nem que seja de alguns passos.\n - Saia do carro e se alongue." 
                },
                {
                    "titulo": "Exercícios físicos",
                    "tipo": "texto",
                    "conteudo":"Encontre formas de melhorar sua rotina é acrescentar exercícios físicos.\n\n Pratique atividade física.\n\n Colocar o corpo em movimento de forma regular contribui não  só para o bem estar físico, mas também,  para a saúde emocional."
                }
            ]
        ]
    }
];