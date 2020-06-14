import 'package:flutter/material.dart';

class HealthTile extends StatelessWidget {
  
  HealthTile(this.artigo);

  final artigo;


  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsetsDirectional.only(bottom: 16),
      elevation: 10,
      child: Container(
          width: 300,
          padding: EdgeInsets.fromLTRB(16, 20, 16, 4),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(artigo[0]['titulo'],
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            ButtonBar(
              children: [
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text("ACESSAR"),
                  onPressed: () {
                    testDialogs(context,artigo);
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

void testDialogs(context, dados) {

  var atual = 0;
    showCustomDialog(context: context, dados: dados, atual: atual);
}
