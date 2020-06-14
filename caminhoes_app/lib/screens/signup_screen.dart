import 'package:caminhoes_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final _nameControler = TextEditingController();
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  validator: (text) {
                    if (text.isEmpty) return "Nome inválido";
                    return null;
                  },
                  controller: _nameControler,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "E-mail inválido";
                    return null;
                  },
                  controller: _emailControler,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha inválida";
                    return null;
                  },
                  controller: _passwordControler,
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                      onPressed: () {
                        Map<String,dynamic> userData = {
                          "name": _nameControler.text,
                          "email":_emailControler.text
                        };

                        print(userData);
                        if (_formKey.currentState.validate()) {
                          model.signUp(
                            userData: userData, 
                            pass: _passwordControler.text, 
                            onSuccess: _onSuccess, 
                            onFail: _onFail
                          );
                        }
                      },
                      child: Text(
                        "Criar conta",
                        style: TextStyle(fontSize: 18),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor),
                )
              ],
            ),
          );
        })
      );

  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Usuário criado com sucesso"),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(seconds: 2),
      )
    );

    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pop());
  }
  
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Falha ao criar usuário"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      )
    );

    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pop());
  }

}
