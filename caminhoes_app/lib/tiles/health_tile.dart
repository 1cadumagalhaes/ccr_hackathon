

import 'package:flutter/material.dart';

class HealthTile extends StatelessWidget {
  const HealthTile({
    Key key,
    @required this.content,
    this.titulo,
  }) : super(key: key);

  final titulo;
  final content;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.only(bottom: 16),
      elevation: 10,
      child: Container(
          width: 300,
          padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(titulo,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ButtonBar(
              children: [
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text("ACESSAR"),
                  onPressed: () {
                    testDialogs(context);
                  },
                )
              ],
            )
          ])),
    );
  }
}

void showCustomDialog({BuildContext context, List dados, int atual}) {
  var continuar = dados.length > atual + 1;
  var titulo = dados[atual]['titulo'];
  var conteudo = dados[atual]['conteudo'];

  Dialog textDialog = Dialog(
    child: Container(
        width: 300,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titulo,
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              conteudo,
              textAlign: TextAlign.justify,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('${continuar ? "CONTINUAR" : "FECHAR"}'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (continuar)
                      showCustomDialog(
                          context: context, dados: dados, atual: atual + 1);
                  },
                )
              ],
            )
          ],
        )),
  );

  showDialog(context: context, builder: (context) => textDialog);
}

void testDialogs(context) {
  var dados = [
    {
      "titulo": "Cuide da sua alimentação",
      "tipo": "texto",
      "conteudo":
          "Comer bem não tem a ver apenas com a boa forma física, mas com o bem-estar geral. Opte por um cardápio variado e equilibrado. E nem precisa ser nada mirabolante, e sim usando o que você  tem no dia a dia mesmo."
    },
    {
      "titulo": "Cuide da sua alimentação",
      "tipo": "texto",
      "conteudo":
          "Seguem algumas dicas:\n - Alimente-se devagar\n -  Mastigue bem \n - Beba água suficiente para seu corpo \n - Consuma  frutas e verduras \n - Reduza o consumo de açúcar\n - Aposte em saladas também \n - Reduza o consumo de álcool e outras drogas."
    }
  ];
  showCustomDialog(context: context, dados: dados, atual: 0);
}
