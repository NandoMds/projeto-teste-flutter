import 'package:flutter/material.dart';
import 'dart:async' show Future;

class TermoEcondicao extends StatefulWidget {
  @override
  _TermoEcondicaoState createState() => _TermoEcondicaoState();
}

class _TermoEcondicaoState extends State<TermoEcondicao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(254, 40, 40, 44),
        title: const Text('Termos & Condições')
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 5, bottom: 5),
        child: SingleChildScrollView(child: buildContainer(),),
      ),
    );
  }
  buildContainer() {
    return Container(
          child: FutureBuilder(
            future: getFutureDados(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Text(
                      snapshot.data,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }));
}
Future<String> getFutureDados(BuildContext context) async {
        return await DefaultAssetBundle.of(context).loadString('assets/Termos&Condições.txt');
  }
}