/// page de paiement

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class Contrat extends StatefulWidget {
  @override
  _ContratState createState() => _ContratState();
}

class _ContratState extends State<Contrat> {
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
              SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
              Center(
                  child: Text('Abonnement',
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizedConfig.blockSizeHorizontal * 5,
                        ),
                        Container(
                            width: SizedConfig.blockSizeHorizontal * 42.5,
                            child: Column(children: [
                              Text(
                                'Nom',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize:
                                        SizedConfig.blockSizeHorizontal * 5),
                              ),
                              Container(
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
                          width: SizedConfig.blockSizeHorizontal * 5,
                        ),
                        Container(
                            width: SizedConfig.blockSizeHorizontal * 42.5,
                            child: Column(children: [
                              Text('Prenom',
                                  style: TextStyle(
                                      color: Colors.blue[800],
                                      fontSize:
                                          SizedConfig.blockSizeHorizontal * 5)),
                              Container(
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
                      ],
                    ),
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
                        // mettre les zones definies dans la base
                        child: Column(children: [
                      Text('Zone',
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
                      height: SizedConfig.blockSizeVertical * 2,
                    ),
                    Row(children: [
                      SizedBox(
                        width: SizedConfig.blockSizeHorizontal * 2.5,
                      ),
                      Container(
                          width: SizedConfig.blockSizeHorizontal * 30,
                          height: SizedConfig.blockSizeVertical * 25,
                          padding: EdgeInsets.all(
                              SizedConfig.blockSizeHorizontal * 5),
                          decoration: BoxDecoration(
                            color: Colors.blue[700],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text(
                                  'informations about abonnement' // informations d'abonnement
                                  ),
                              Checkbox(
                                value: wedVal,
                                onChanged: (bool value) {
                                  setState(() {
                                    wedVal = value;
                                    monVal = false;
                                    tuVal = false;
                                  });
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        width: SizedConfig.blockSizeHorizontal * 2,
                      ),
                      Container(
                          width: SizedConfig.blockSizeHorizontal * 30,
                          height: SizedConfig.blockSizeVertical * 25,
                          padding: EdgeInsets.all(
                              SizedConfig.blockSizeHorizontal * 5),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text('informations about abonnement'),
                              Checkbox(
                                value: monVal,
                                onChanged: (bool value) {
                                  setState(() {
                                    monVal = value;
                                    tuVal = false;
                                    wedVal = false;
                                  });
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        width: SizedConfig.blockSizeHorizontal * 2,
                      ),
                      Container(
                          width: SizedConfig.blockSizeHorizontal * 30,
                          height: SizedConfig.blockSizeVertical * 25,
                          padding: EdgeInsets.all(
                              SizedConfig.blockSizeHorizontal * 5),
                          decoration: BoxDecoration(
                            color: Colors.blue[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Text('informations about abonnement'),
                              Checkbox(
                                value: tuVal,
                                onChanged: (bool value) {
                                  setState(() {
                                    tuVal = value;
                                    monVal = false;
                                    wedVal = false;
                                  });
                                },
                              ),
                            ],
                          ))
                    ]),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 2,
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
                        child: Text('Abonnement'),
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
                    Text("En m'abonnant j'accepte les Terms et Conditions",
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: SizedConfig.blockSizeHorizontal * 4)),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 3,
                    ),
                  ]))
            ]),
          )
        ]));
  }
}
