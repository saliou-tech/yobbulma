import 'package:flutter/material.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/model/Abonne.dart';

import '../../contants.dart';

class AbonneInfo extends StatefulWidget {
  AbonneModel abonne;
  AbonneInfo(this.abonne);
  @override
  _AbonneInfoState createState() => _AbonneInfoState();
}

class _AbonneInfoState extends State<AbonneInfo> {
  @override
  Widget build(BuildContext context) {
    Color _color = Colors.blue[800];
    bool isDisable = false; // pour bloquer le boutton une fois avoir quitter

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryLightColor,
        title: Text("detaille de la commande"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: SizedConfig.blockSizeVertical * 20,
            ),
            Container(
              margin: EdgeInsets.all(SizedConfig.blockSizeHorizontal * 3),
              height: SizedConfig.blockSizeVertical * 15,
              width: SizedConfig.blockSizeHorizontal * 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: Colors.blue[800],
                    width: 2,
                  )),
              child: Icon(
                Icons.person,
                color: Colors.blue[800],
                size: 60,
              ),
            ),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
            Row(children: [
              Container(
                width: SizedConfig.blockSizeVertical * 15,
                child: Text(
                  'Nom',
                  style: new TextStyle(fontSize: 20.0, color: kPrimaryColor),
                ),
              ),
              Expanded(
                child: Expanded(
                  child: Container(
                      width: SizedConfig.blockSizeVertical * 33,
                      child: Text(
                        widget.abonne.nom, // a dynamiser
                        style: new TextStyle(
                            fontSize: 20.0, color: Colors.blue[200]),
                      )),
                ),
              ),
            ]),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 5),
            Row(children: [
              Container(
                width: SizedConfig.blockSizeVertical * 15,
                child: Text(
                  'Prenom',
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                ),
              ),
              Expanded(
                child: Container(
                    width: SizedConfig.blockSizeVertical * 33,
                    child: Text(
                      widget.abonne.prenom, // a dynamiser
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.blue[200]),
                    )),
              ),
            ]),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 5),
            Row(children: [
              Container(
                width: SizedConfig.blockSizeVertical * 15,
                child: Text(
                  'Telephone',
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                ),
              ),
              Expanded(
                child: Container(
                    width: SizedConfig.blockSizeVertical * 33,
                    child: Text(
                      widget.abonne.telephone, // a dynamiser
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.blue[200]),
                    )),
              ),
            ]),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 5),
            Row(children: [
              Container(
                width: SizedConfig.blockSizeVertical * 15,
                child: Text(
                  'Adresse',
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                ),
              ),
              Expanded(
                child: Container(
                    width: SizedConfig.blockSizeVertical * 33,
                    child: Text(
                      widget.abonne.adresse, // a dynamiser
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.blue[200]),
                    )),
              ),
            ]),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 5),
            Row(children: [
              Container(
                width: SizedConfig.blockSizeVertical * 15,
                child: Text(
                  'Besoin',
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                ),
              ),
              Expanded(
                child: Container(
                    width: SizedConfig.blockSizeVertical * 33,
                    child: Text(
                      "besoin ",
                      style: new TextStyle(
                          fontSize: 20.0, color: Colors.blue[200]),
                    )),
              ),
            ]),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 10),
/*
            Column(children: [
              RoundedButton(
                textColor: Colors.white,
                text: "affecter",
                color: kPrimaryColor,
                press: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  Map<String, dynamic> besoin = {"id": widget.besoins["id"]};
                  Map<String, dynamic> livreur = {"id": widget.livreur.id};
                  Map<String, dynamic> livraison = {
                    "besoin": besoin,
                    "livreur": livreur
                  };
                  newlivraison = await UtilisateurService.instance
                      .enregistrerLivraison(livraison);
                  print(newlivraison);
                  if (newlivraison == null) {
                    setState(() {
                      showSpinner = false;
                    });

                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: false,
                        title: 'Error',
                        desc: ' Oups !!une erreure est survenue!!!',
                        btnOkOnPress: () {
                          showSpinner = false;
                        },
                        btnOkIcon: Icons.cancel,
                        btnOkColor: Colors.red)
                      ..show();
                  } else {
                    AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        title: 'besoins enoyes au livreur',
                        desc: "besoins envoyes au livreur",
                        btnOkOnPress: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return ProfilChef();
                              },
                            ),
                          );
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return ProfilChef();
                              },
                            ),
                          );
                        })
                      ..show();
                  }
                },
              ),
              RoundedButton(
                textColor: Colors.white,
                text: "annuler",
                color: kPrimaryLightColor,
                press: () {},
              )
              */
/*FlatButton(
                onPressed: () {
                  if (isDisable == true) {
                    return null;
                  } else {
                    return _showDialog("Vous venez de confirmer la reception");
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(SizedConfig.blockSizeVertical * 1),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
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
                  child: Text(
                    "confirmer la reception", // l'etat du besoin passe à 'en cours'
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (isDisable == true) {
                    return null;
                  } else {
                    return _showDialog("Vous venez de rejetter la demande");
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(SizedConfig.blockSizeVertical * 1),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    "Rejeter la demande", // l'etat du besoin passe à 'rejetté'
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              )*/ /*

            ])
*/
          ]),
        ),
      ),
    );
  }
}
