import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ComplaintTab extends StatefulWidget {
  @override
  _ComplaintTabState createState() => _ComplaintTabState();
}

class _ComplaintTabState extends State<ComplaintTab> {
  final _assuntoController = TextEditingController();
  final _textoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ScopedModelDescendant<UserModel>(
      builder: (context, child, model) {
        return Form(
          key: _formKey,
          child: ListView(padding: EdgeInsets.all(16), children: [
            TextFormField(
              controller: _assuntoController,
              decoration: InputDecoration(hintText: 'Assunto'),
              validator: (text) {
                if (text.isEmpty) return "Preencha o assunto por favor";
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              maxLines: 10,
              controller: _textoController,
              decoration: InputDecoration(hintText: 'Descrição'),
              validator: (text) {
                if (text.isEmpty) return "Você precisa preencher a descrição";
                return null;
              },
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      model.registerComplaint(
                          subject: _assuntoController.text,
                          body: _textoController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail);
                    }
                  },
                  child: Text(
                    "Enviar",
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor),
            )
          ]),
        );
      },
    ));
  }

  void _onSuccess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Enviado com sucesso, em breve entraremos em contato"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 2),
    ));

    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao enviar"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));

    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()))); 
  }
}
