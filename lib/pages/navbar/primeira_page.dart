import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                height: MediaQuery.of(context).size.height/2.6,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/img/home.jpg'), fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),

            //Botão Login
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'login');
                    },
                    color: Color(0xFFf25e1a),
                    child: Text('Login', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )),
                  ),
                ),
              ),
            ),

            //Botão Cadastrar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'cadastrar');
                    },
                    color: Color(0xFFf25e1a),
                    child: Text('Cadastrar', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}