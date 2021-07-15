// paiement de l'abonnement

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/contants.dart';
import 'package:project/model/PaiementModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Paiement extends StatefulWidget {
  Map<String, dynamic> Abonne;
  Map<String, dynamic> Abonnement;
  Paiement(this.Abonne, this.Abonnement);

  @override
  _PaiementState createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  bool _visibleCard = false;
  bool _visiblePay = false;
  bool _visiblePaypal = false;

  PaiementModel paiement = new PaiementModel();

  void _toggleCard() {
    setState(() {
      _visibleCard = false;
      paiement.ModDePaiment = "carte bancaire";
      _visiblePay = true;
      _visiblePaypal = false;
    });
  }

  void _togglePay() {
    setState(() {
      _visiblePay = true;
      paiement.ModDePaiment = "paydunya";
      _visibleCard = false;
      _visiblePaypal = false;
    });
  }

  void _togglePaypal() {
    setState(() {
      _visiblePaypal = false;
      paiement.ModDePaiment = "paypal";
      _visiblePay = true;
      _visibleCard = false;
    });
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        //headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          SizedBox(
            height: SizedConfig.blockSizeVertical * 10,
          ),
          Text(
            "- Choisir un mode de paiement",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: SizedConfig.blockSizeHorizontal * 5),
          ),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Row(children: [
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 5,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizedConfig.blockSizeVertical * 2,
                  bottom: SizedConfig.blockSizeVertical * 2,
                  left: SizedConfig.blockSizeVertical * 1,
                  right: SizedConfig.blockSizeVertical * 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: () {
                  _toggleCard();
                },
                child: Image.asset(
                  'assets/card.png',
                  fit: BoxFit.cover,
                  width: SizedConfig.blockSizeVertical * 6,
                ),
              ),
            ),
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 7,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizedConfig.blockSizeVertical * 2,
                  bottom: SizedConfig.blockSizeVertical * 2,
                  left: SizedConfig.blockSizeVertical * 1,
                  right: SizedConfig.blockSizeVertical * 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: () {
                  _togglePay();
                },
                child: Image.asset(
                  'assets/pay.png',
                  fit: BoxFit.cover,
                  width: SizedConfig.blockSizeVertical * 6,
                ),
              ),
            ),
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 7,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: SizedConfig.blockSizeVertical * 2,
                  bottom: SizedConfig.blockSizeVertical * 2,
                  left: SizedConfig.blockSizeVertical * 1,
                  right: SizedConfig.blockSizeVertical * 1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: FlatButton(
                onPressed: () {
                  _togglePaypal();
                },
                child: Image.asset(
                  'assets/paypal.png',
                  fit: BoxFit.cover,
                  width: SizedConfig.blockSizeVertical * 6,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 10,
          ),
          Visibility(visible: _visibleCard, child: FormCard()),
          Visibility(visible: _visiblePay, child: Formpay()),
          Visibility(visible: _visiblePaypal, child: FormPaypal()),
          RoundedButton(
            text: "S'ABONNER",
            color: kPrimaryColor,
            press: () async {
              Map<String, dynamic> Paiement = {
                "dateDebut": paiement.dateDebut,
                "dateFin": paiement.dateFin,
                "ModDePaiment": paiement.ModDePaiment
              };
              //String url = await UtilisateurService.instance.Paiement();
              _launchInBrowser("http://localhost:8080//paydunya.com/sandbox-checkout/invoice/test_TKg1OmP4V2");

              // Retourne true si le formulaire est valide, sinon false

              // Affiche le Snackbar si le formulaire est valide
              /*   Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Traitement en cours')));*/
            },
          )
        ]));
  }
}

class FormCard extends StatelessWidget {
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(children: [
          Text(
            "- Entrez les informations de paiement de carte",
            style: TextStyle(
                color: kPrimaryLightColor,
                fontSize: SizedConfig.blockSizeHorizontal * 5),
          ),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Container(
              child: Column(children: [
            Text(
              'Numero de Carte',
              style: TextStyle(
                  color: kPrimaryLightColor,
                  fontSize: SizedConfig.blockSizeHorizontal * 4),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: SizedConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizedConfig.blockSizeHorizontal * 90,
              decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              child: TextFormField(
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
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Container(
              child: Row(children: [
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 2,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "Date Exp",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 4.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "code CVV",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                  ),
                ]))
          ])),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          SizedBox(
            width: SizedConfig.blockSizeHorizontal * 60,
            height: SizedConfig.blockSizeVertical * 5,
/*
            child: FlatButton(
              onPressed: () {
                // Retourne true si le formulaire est valide, sinon false
                if (_formKey.currentState.validate()) {
                  // Affiche le Snackbar si le formulaire est valide
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Traitement en cours')));
                }
              },
              child: Text('Confirmer'),
              textColor: Colors.white,
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue[800],
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
            ),
*/
          ),
/*
          RoundedButton()
*/
        ]));
  }
}

class Formpay extends StatelessWidget {
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(children: [
          Center(
            child: Text(
              "Paydunya accepte tous les moyens de paiement ci desssous",
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: SizedConfig.blockSizeHorizontal * 5),
            ),
          ),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Container(
              child: Column(children: [
            /* Text(
              'Numero de Carte',
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: SizedConfig.blockSizeHorizontal * 4),
              textAlign: TextAlign.left,
            ),*/
            SizedBox(
              height: SizedConfig.blockSizeVertical * 2,
            ),
            FlatButton(
              onPressed: () {},
              child: Image.asset(
                'assets/paydunya.png',
                fit: BoxFit.cover,
                width: SizedConfig.blockSizeVertical * 52,
              ),
            ),
            /*Container(
              width: SizedConfig.blockSizeHorizontal * 90,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Veuillez saisir un texte';
                  }
                  return null;
                },
              ),
            ),*/
          ])),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          /* Container(
              child: Row(children: [
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 2,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "Date Exp",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 4.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "code CVV",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                  ),
                ]))
          ])),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          SizedBox(
            width: SizedConfig.blockSizeHorizontal * 60,
            height: SizedConfig.blockSizeVertical * 5,
*/ /*
            child: FlatButton(
              onPressed: () {
                // Retourne true si le formulaire est valide, sinon false
                if (_formKey.currentState.validate()) {
                  // Affiche le Snackbar si le formulaire est valide
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Traitement en cours')));
                }
              },
              child: Text('Confirmer'),
              textColor: Colors.white,
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue[800],
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
            ),
*/ /*
          ),*/
        ]));
  }
}

class FormPaypal extends StatelessWidget {
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        child: Column(children: [
          Text(
            "- Entrez les informations de paiement de Paypal",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: SizedConfig.blockSizeHorizontal * 5),
          ),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Container(
              child: Column(children: [
            Text(
              'Numero de Carte',
              style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: SizedConfig.blockSizeHorizontal * 4),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: SizedConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizedConfig.blockSizeHorizontal * 90,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
              child: TextFormField(
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
            height: SizedConfig.blockSizeVertical * 5,
          ),
          Container(
              child: Row(children: [
            SizedBox(
              width: SizedConfig.blockSizeHorizontal * 2,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "Date Exp",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 4.5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
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
              width: SizedConfig.blockSizeHorizontal * 3,
            ),
            Container(
                width: SizedConfig.blockSizeHorizontal * 30,
                child: Column(children: [
                  Text(
                    "code CVV",
                    style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: SizedConfig.blockSizeHorizontal * 4),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10.0),
                        )),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir un texte';
                        }
                        return null;
                      },
                    ),
                  ),
                ]))
          ])),
          SizedBox(
            height: SizedConfig.blockSizeVertical * 5,
          ),
          SizedBox(
            width: SizedConfig.blockSizeHorizontal * 60,
            height: SizedConfig.blockSizeVertical * 5,
/*
            child: FlatButton(
              onPressed: () {
                // Retourne true si le formulaire est valide, sinon false
                if (_formKey.currentState.validate()) {
                  // Affiche le Snackbar si le formulaire est valide
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Traitement en cours')));
                }
              },
              child: Text('Confirmer'),
              textColor: Colors.white,
              color: Colors.blue[800],
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.blue[800],
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(50)),
            ),
*/
          ),
        ]));
  }
}
