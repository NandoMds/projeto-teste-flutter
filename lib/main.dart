import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'pages/cadastro/cadastrar.dart';
import 'pages/cadastro/termosecondicoes.dart';
import 'pages/logar/esquecisenha.dart';
import 'pages/logar/login.dart';
import 'pages/navbar/navbar.dart';
import 'pages/navbar/primeira_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>MyHomePage(),
        'cadastrar':(context)=>CadastroPage(),
        'Termos&Condicoes':(context)=>TermoEcondicao(),
        'login':(context)=>LoginPage(),
        'home':(context)=>NavBarPage(),
        'esquecisenha':(context)=>EsqueciSenha(),
        'start':(context)=>StartPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        backgroundColor: Colors.white,
        navigateAfterSeconds: StartPage(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/opcoes-de-cores.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}