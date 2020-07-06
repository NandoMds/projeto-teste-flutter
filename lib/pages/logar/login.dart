import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            child: ListView(
              children: <Widget>[
                Padding(
          padding: const EdgeInsets.only(right: 40, left: 4, top: 5),
          child: new TextFormField(
              decoration: new InputDecoration(icon: Icon(Icons.phone_android),
                      hintText: 'Digite seu celular',
                      labelText: 'Celular',),
              keyboardType: TextInputType.phone,
              maxLength: 10,
              ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 4),
          child: new TextFormField(
              decoration: new InputDecoration(icon: Icon(Icons.email),
                        hintText: 'Digite seu e-mail',
                        labelText: 'E-mail',),
              keyboardType: TextInputType.emailAddress,
              ),
        ),

        Padding(
                  padding: const EdgeInsets.only(right: 40, left: 4, top: 15, bottom: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Insira sua senha',
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                  ),
                ),

                InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'esquecisenha');
            },
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Esqueceu a Senha?',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),

                Container(margin: EdgeInsets.only(),
                  padding: const EdgeInsets.only(left: 40, top: 20, right: 40, bottom: 20),
                  child: RaisedButton(
                    child: const Text('Logar'),
                    onPressed: (){
                      Navigator.pushNamed(context, 'home');
                    },
                    textColor: Colors.white,
                    color: Colors.deepOrange,
                  ),
                ),
          InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'cadastrar');
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Não possui uma conta? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Faça o Cadastro!',
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}