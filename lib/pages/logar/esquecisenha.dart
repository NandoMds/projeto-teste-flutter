import 'package:flutter/material.dart';

class EsqueciSenha extends StatefulWidget {
  @override
  _EsqueciSenhaState createState() => _EsqueciSenhaState();
}

class _EsqueciSenhaState extends State<EsqueciSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(254, 40, 40, 44),
        title: const Text('Esqueci a Senha')
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 4, top: 5),
          child: Form(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 20, top: 100),
                  child: Text(
                    'Digite seu CPF e e-mail que enviaremos o link em seu e-mail para alterar sua senha',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 4, top: 5),
                  child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: Icon(Icons.person_pin),
                        hintText: 'Digite seu CPF',
                        labelText: 'CPF',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String val) {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 4, top: 5),
                  child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Digite seu e-mail',
                        labelText: 'E-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String val) {}),
                ),
                Container(margin: EdgeInsets.only(),
                  padding: const EdgeInsets.only(left: 40, top: 20, right: 20, bottom: 20),
                  child: RaisedButton(
                    child: const Text('Enviar'),
                    onPressed: (){
                    },
                    textColor: Colors.white,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
