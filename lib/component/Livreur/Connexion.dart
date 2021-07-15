import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/component/Abonne/home.dart';

class Connexion extends StatefulWidget {
  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(height: SizedConfig.blockSizeHorizontal * 20),
          Center(
              child: Text('Connexion',
                  style: new TextStyle(
                    fontSize: SizedConfig.blockSizeHorizontal * 10,
                    color: Colors.blue[800],
                  ))),
          Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  height: SizedConfig.blockSizeVertical * 10,
                ),
                Container(
                    child: Column(children: [
                  Text('Pseudo',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: SizedConfig.blockSizeHorizontal * 6)),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Entrer du texte',
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(100.0),
                          ),
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),
                ])),
                SizedBox(
                  height: SizedConfig.blockSizeVertical * 3,
                ),
                Container(
                    child: Column(children: [
                  Text('Mot de passe',
                      style: TextStyle(
                          color: Colors.blue[800],
                          fontSize: SizedConfig.blockSizeHorizontal * 6)),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Entrer du texte',
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(100.0),
                          ),
                        )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Veuillez saisir un texte';
                      }
                      return null;
                    },
                  ),
                ])),
                SizedBox(
                  height: SizedConfig.blockSizeVertical * 5,
                ),
                SizedBox(
                  width: SizedConfig.blockSizeHorizontal * 95,
                  height: SizedConfig.blockSizeVertical * 5,
                  child: FlatButton(
                    onPressed: () {
                      // Retourne true si le formulaire est valide, sinon false
                      if (_formKey.currentState.validate()) {
                        // Affiche le Snackbar si le formulaire est valide
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Traitement en cours')));
                      }
                    },
                    child: Text('Connexion',
                        style: TextStyle(
                            fontSize: SizedConfig.blockSizeHorizontal * 5)),
                    textColor: Colors.white,
                    color: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.blue[800],
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                ),
              ]))
        ]));
  }
}
