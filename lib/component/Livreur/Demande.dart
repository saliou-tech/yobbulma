import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Livraison.dart';

import '../../contants.dart';

// les besoins affectes au livreur
// s'il est accepter il tranfere dans la partie Demande Confirme

class Demande extends StatefulWidget {
  List<Livraison> livraison;
  Demande(this.livraison);

  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  AbonneModel abonne;
  @override
  Widget build(BuildContext context) {
    print(widget.livraison);
    Color _color = Colors.blue[800];

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        itemCount: widget.livraison.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Container(
                    margin: EdgeInsets.all(SizedConfig.blockSizeHorizontal * 3),
                    height: SizedConfig.blockSizeVertical * 10,
                    width: SizedConfig.blockSizeHorizontal * 20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border: Border.all(
                          color: Colors.blue[800],
                          width: 2,
                        )),
                    child: Icon(
                      Icons.person,
                      color: Colors.blue[800],
                      size: 50,
                    ),
                  ),
                  Container(
                    height: SizedConfig.blockSizeVertical * 15,
                    width: SizedConfig.blockSizeHorizontal * 60,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue[800],
                          width: 2,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizedConfig.blockSizeVertical * 4,
                        ),
                        Row(children: [
                          Container(
                            width: SizedConfig.blockSizeHorizontal * 45,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Besoin du", // a dynamiser
                                    style: new TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue[800]),
                                  ),
                                  Text(
                                    "${widget.livraison[index].besoin["date"]}", // a dynamiser
                                    style: new TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.blue[800]),
                                  ),
                                ]),
                          ),
                        ]),
                        SizedBox(
                          height: SizedConfig.blockSizeVertical * 1,
                        ),
                        Row(
                          children: [
                            Icon(Icons.message,
                                color: Colors.blue[800], size: 20),
                            Container(
                              width: SizedConfig.blockSizeHorizontal * 55,
                              child: Text(
                                "Cliquez sur detaille pour voir les informations de la commande", // prenom et nom a dynamiser
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colors.blue[300]),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
                SizedBox(
                  height: SizedConfig.blockSizeVertical * 4,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: SizedConfig.blockSizeHorizontal * 45,
                    ),
                    GestureDetector(
                      onTap: () async {
                        abonne = await UtilisateurService.instance
                            .getAbonneByBesoin(
                                widget.livraison[index].besoin["id"]);
                        if (abonne != null) {
                          AwesomeDialog(
                            context: context,
                            animType: AnimType.SCALE,
                            dialogType: DialogType.INFO,
                            body: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(children: [
                                  SizedBox(
                                    height: SizedConfig.blockSizeVertical * 20,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(
                                        SizedConfig.blockSizeHorizontal * 3),
                                    height: SizedConfig.blockSizeVertical * 15,
                                    width: SizedConfig.blockSizeHorizontal * 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(100)),
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
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 15),
                                  Row(children: [
                                    Container(
                                      width: SizedConfig.blockSizeVertical * 15,
                                      child: Text(
                                        'Nom',
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: kPrimaryColor),
                                      ),
                                    ),
                                    Expanded(
                                      child: Expanded(
                                        child: Container(
                                            width:
                                                SizedConfig.blockSizeVertical *
                                                    33,
                                            child: Text(
                                              abonne.nom, // a dynamiser
                                              style: new TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.blue[200]),
                                            )),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 5),
                                  Row(children: [
                                    Container(
                                      width: SizedConfig.blockSizeVertical * 15,
                                      child: Text(
                                        'Prenom',
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.blue[800]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: SizedConfig.blockSizeVertical *
                                              33,
                                          child: Text(
                                            abonne.prenom, // a dynamiser
                                            style: new TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.blue[200]),
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 5),
                                  Row(children: [
                                    Container(
                                      width: SizedConfig.blockSizeVertical * 15,
                                      child: Text(
                                        'Telephone',
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.blue[800]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: SizedConfig.blockSizeVertical *
                                              33,
                                          child: Text(
                                            abonne.telephone, // a dynamiser
                                            style: new TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.blue[200]),
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 5),
                                  Row(children: [
                                    Container(
                                      width: SizedConfig.blockSizeVertical * 15,
                                      child: Text(
                                        'Adresse',
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.blue[800]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: SizedConfig.blockSizeVertical *
                                              33,
                                          child: Text(
                                            abonne.adresse, // a dynamiser
                                            style: new TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.blue[200]),
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 5),
                                  Row(children: [
                                    Container(
                                      width: SizedConfig.blockSizeVertical * 15,
                                      child: Text(
                                        'profile',
                                        style: new TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.blue[800]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          width: SizedConfig.blockSizeVertical *
                                              33,
                                          child: Text(
                                            abonne.profile,
                                            style: new TextStyle(
                                                fontSize: 20.0,
                                                color: Colors.blue[200]),
                                          )),
                                    ),
                                  ]),
                                  SizedBox(
                                      height:
                                          SizedConfig.blockSizeHorizontal * 10),
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
                            title: 'This is Ignored',
                            desc: 'This is also Ignored',
                            btnOkOnPress: () {},
                          )..show();
                          /* Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return AbonneInfo(abonne);
                              },
                            ),
                          );*/
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.all(SizedConfig.blockSizeVertical * 2),
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          "Details de la commande",
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ]);
        },
      ),
    );
  }
}
