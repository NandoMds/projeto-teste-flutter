import 'package:agoravai/pages/home/curriculo_page.dart';
import 'package:agoravai/pages/home/home_page.dart';
import 'package:agoravai/pages/home/perfil_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: NavBarPage()));

class NavBarPage extends StatefulWidget {
  @override
  _NavBarPageState createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {

  int _page = 1;

  final _pageOption = [
    CurriculoPage(),
    HomePage(),
    PerfilPage(),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_page],
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(254, 40, 40, 44),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color.fromARGB(254, 40, 40, 44),
        height: 50,
        items: <Widget>[
          Icon(Icons.pages,size:20,color:Colors.white),
          Icon(Icons.home,size:20,color:Colors.white),
          Icon(Icons.person,size:20,color:Colors.white),
        ],
        animationDuration: Duration(
          milliseconds: 250
        ),
        index: 1,
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          setState((){
            _page = index;
          });
        },
      ),
    );
  }
}