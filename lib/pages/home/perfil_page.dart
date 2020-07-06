import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 4, top: 5),
          child: Form(
            child: ListView(
              children: <Widget>[
                Container(margin: EdgeInsets.only(),
                  padding: const EdgeInsets.only(left: 40, top: 20, right: 20, bottom: 20),
                  child: RaisedButton(
                    child: const Text('Sair'),
                    onPressed: (){
                      Navigator.pushNamed(context, 'start');
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