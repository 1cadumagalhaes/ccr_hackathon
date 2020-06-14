import 'package:caminhoes_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:caminhoes_app/models/user_model.dart';
import 'package:caminhoes_app/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailControler = TextEditingController();
  final _passwordControler = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(fontSize: 15),
              ),
              textColor: Colors.white,
            )
          ],
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
                    controller: _emailControler,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail inválido";
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordControler,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha inválida";
                      return null;
                    },
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: (){

                          model.recoverPass(_emailControler.text);
                          if(_emailControler.text.isEmpty){
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Insira seu e-mail para recuperação"),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),
                            ));
                          }else{
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Confira seu e-mail"),
                              backgroundColor: Theme.of(context).primaryColor,
                              duration: Duration(seconds: 2),
                            ));

                          }



                        },
                        child: Text(
                          "Esqueci minha senha",
                          textAlign: TextAlign.right,
                        ),
                        padding: EdgeInsets.zero,
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 44,
                    child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            model.signIn(
                                email: _emailControler.text,
                                pass: _passwordControler.text,
                                onSuccess: _onSuccess,
                                onFail: _onFail);
                          }
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(fontSize: 18),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    Future.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pop()).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())));
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao entrar"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));

    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.of(context).pop());
  }
}
