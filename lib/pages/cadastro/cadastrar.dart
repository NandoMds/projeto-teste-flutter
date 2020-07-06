import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  GlobalKey<FormState> _key = new GlobalKey();

  bool _validate = false;

  String nome, email, celular;

  String _senha, _csenha;

  bool checkedValue = false;

  String _validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String _validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if (value.length != 10) {
      return "O celular deve ter 10 dígitos";
    } else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String _validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  _sendForm() {
    if (_key.currentState.validate()) {
      // Sem erros na validação
      _key.currentState.save();
      print("Nome $nome");
      print("Ceclular $celular");
      print("Email $email");
    } else {
      // erro de validação
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: new Form(
          key: _key,
          autovalidate: _validate,
          child: ListView(children: <Widget>[
            new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 4, top: 10),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                        icon: Icon(Icons.person_outline),
                        hintText: 'Digite seu nome completo',
                        labelText: 'Nome'),
                    maxLength: 40,
                    validator: _validarNome,
                    onSaved: (String val) {
                      nome = val;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 4, top: 5),
                  child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: Icon(Icons.phone_android),
                        hintText: 'Digite seu celular',
                        labelText: 'Celular',
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      validator: _validarCelular,
                      onSaved: (String val) {
                        celular = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 4, top: 5),
                  child: new TextFormField(
                      decoration: new InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: 'Digite seu e-mail',
                        labelText: 'E-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 40,
                      validator: _validarEmail,
                      onSaved: (String val) {
                        email = val;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 4, top: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Insira sua senha',
                      labelText: 'Senha',
                    ),
                    onSaved: (valor) => _senha = valor,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 4, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock_outline),
                      hintText: 'Confirme sua senha',
                      labelText: 'Confirmar Senha',
                    ),
                    //validator: (_csenha) => _csenha == _senha ? 'As senhas não são iguais' : null,
                    onSaved: (valor) => _csenha = valor,
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 10),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue;
                          });
                        },
                        activeColor: Colors.deepOrange,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Eu li e aceito os ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Termos & Condições',
                                style: TextStyle(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, 'Termos&Condicoes');
                                  }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: const Text('Cadastrar'),
                    onPressed: () {
                      if (_sendForm() == _validate) {
                        Navigator.pushNamed(context, 'login');
                      } else {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: true, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Informações Inválidas'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Por Favor, tente novamente.')
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    textColor: Colors.white,
                    color: Colors.deepOrange,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Já possui uma conta? ',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: 'Faça o Login!',
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
          ]),
        ),
      ),
    ));
  }
}
