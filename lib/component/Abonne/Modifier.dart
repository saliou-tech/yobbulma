//  modifier le compte de l'abonne

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/component/Abonne/home.dart';

class Modifier extends StatefulWidget {
  @override
  _ModifierState createState() => _ModifierState();
}

class _ModifierState extends State<Modifier> {
  final _formKey = GlobalKey<FormState>();
  bool monVal = false;
  bool tuVal = false;
  bool wedVal = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    {}
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(primary: true, shrinkWrap: false, slivers: <
            Widget>[
          SliverToBoxAdapter(
            child: Column(children: [
              SizedBox(height: SizedConfig.blockSizeHorizontal * 25),
              Center(
                  child: Text('Modifier Compte',
                      style: new TextStyle(
                        fontSize: SizedConfig.blockSizeHorizontal * 7,
                        color: Colors.blue[800],
                      ))),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 5,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Nom',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: SizedConfig.blockSizeHorizontal * 5)),
                      Container(
                        width: SizedConfig.blockSizeHorizontal * 97,
                        padding: EdgeInsets.only(
                            left: SizedConfig.blockSizeHorizontal * 3,
                            top: SizedConfig.blockSizeHorizontal * 1,
                            bottom: SizedConfig.blockSizeHorizontal * 1,
                            right: SizedConfig.blockSizeHorizontal * 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Entrer du texte',
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez saisir un texte';
                            }
                            return null;
                          },
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 2,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Prenom',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: SizedConfig.blockSizeHorizontal * 5)),
                      Container(
                        width: SizedConfig.blockSizeHorizontal * 97,
                        padding: EdgeInsets.only(
                            left: SizedConfig.blockSizeHorizontal * 3,
                            top: SizedConfig.blockSizeHorizontal * 1,
                            bottom: SizedConfig.blockSizeHorizontal * 1,
                            right: SizedConfig.blockSizeHorizontal * 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Entrer du texte',
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez saisir un texte';
                            }
                            return null;
                          },
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 2,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Telephone',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: SizedConfig.blockSizeHorizontal * 5)),
                      Container(
                        width: SizedConfig.blockSizeHorizontal * 97,
                        padding: EdgeInsets.only(
                            left: SizedConfig.blockSizeHorizontal * 3,
                            top: SizedConfig.blockSizeHorizontal * 1,
                            bottom: SizedConfig.blockSizeHorizontal * 1,
                            right: SizedConfig.blockSizeHorizontal * 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Entrer du texte',
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez saisir un texte';
                            }
                            return null;
                          },
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 2,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Adresse',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: SizedConfig.blockSizeHorizontal * 5)),
                      Container(
                        width: SizedConfig.blockSizeHorizontal * 97,
                        padding: EdgeInsets.only(
                            left: SizedConfig.blockSizeHorizontal * 3,
                            top: SizedConfig.blockSizeHorizontal * 1,
                            bottom: SizedConfig.blockSizeHorizontal * 1,
                            right: SizedConfig.blockSizeHorizontal * 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Entrer du texte',
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Veuillez saisir un texte';
                            }
                            return null;
                          },
                        ),
                      ),
                    ])),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 2,
                    ),
                    Container(
                        child: Column(children: [
                      Text('Zone',

                          /// les zones definies dans la base de donnee
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: SizedConfig.blockSizeHorizontal * 5)),
                      Container(
                        width: SizedConfig.blockSizeHorizontal * 97,
                        padding: EdgeInsets.only(
                            left: SizedConfig.blockSizeHorizontal * 3,
                            top: SizedConfig.blockSizeHorizontal * 1,
                            bottom: SizedConfig.blockSizeHorizontal * 1,
                            right: SizedConfig.blockSizeHorizontal * 3),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text("First Item"),
                                  value: 1,
                                ),
                                DropdownMenuItem(
                                  child: Text("Second Item"),
                                  value: 2,
                                ),
                                DropdownMenuItem(
                                    child: Text("Third Item"), value: 3),
                                DropdownMenuItem(
                                    child: Text("Fourth Item"), value: 4)
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              }),
                        ),
                      )
                    ])),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 5,
                    ),
                    SizedBox(
                      width: SizedConfig.blockSizeHorizontal * 60,
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
                        child: Text('Enregister'),
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
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 3,
                    ),
                  ]))
            ]),
          )
        ]));
  }
}
