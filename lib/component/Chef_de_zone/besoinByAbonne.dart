import 'package:flutter/material.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

import '../../contants.dart';
import 'GestionLivreur.dart';

class BesoinByAbonnes extends StatefulWidget {
  AbonneModel abonne;
  List<Besoin> besoins;

  User userfound;
  BesoinByAbonnes({this.abonne, this.userfound, this.besoins});

  _BesoinByAbonnesState createState() => _BesoinByAbonnesState();
}

class _BesoinByAbonnesState extends State<BesoinByAbonnes> {
  @override
  Widget build(BuildContext context) {
    AbonneModel abonneModel;
    Color _color1 = Colors.greenAccent[700];
    Color _color = Colors.red[700];

/*
    var badge = "non affecte"; //etats
*/
    bool _visible = false; // pour cacher ou montrer le boutton
    var texte;

    // les etats
    /* switch (badge) {
      case "non affecte":
        _color = Colors.yellow[600];
        _visible = true;
        texte = "Non Affecté";
        break;
      case "valide":
        _color = Colors.greenAccent[700];
        _visible = false;
        texte = "Validé";
        break;
      case "en cours":
        _color = Colors.orange[600];
        _visible = false;
        texte = "En cours";
        break;
      case "rejette":
        _color = Colors.red[900];
        _visible = true;
        texte = "Rejetté";
        break;
      default:
    }*/

    return widget.besoins != null
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 10,
                  ),
                  Text(
                    "Besoins des Abonnes",
                    style:
                        new TextStyle(fontSize: 28.0, color: Colors.blue[800]),
                  ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: widget.besoins.length,
                        reverse: true,
                        itemBuilder: (BuildContext context, int index) {
                          List<LivreurModel> livreur;
                          return widget.besoins != null
                              ? Column(
                                  children: <Widget>[
                                    Row(children: [
                                      Container(
                                        margin: EdgeInsets.all(
                                            SizedConfig.blockSizeHorizontal *
                                                3),
                                        height:
                                            SizedConfig.blockSizeVertical * 7,
                                        width: SizedConfig.blockSizeHorizontal *
                                            14,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                            border: Border.all(
                                              color: Colors.blue[800],
                                              width: 2,
                                            )),
                                        child: Icon(
                                          widget.besoins[index].statut == true
                                              ? Icons.check
                                              : Icons.clear,
                                          color: widget.besoins[index].statut ==
                                                  true
                                              ? Colors.green[800]
                                              : Colors.red[800],
                                          size: 40,
                                        ),
                                      ),
                                      Container(
                                        height:
                                            SizedConfig.blockSizeVertical * 12,
                                        width: SizedConfig.blockSizeHorizontal *
                                            50,
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
                                              height: SizedConfig
                                                      .blockSizeVertical *
                                                  4,
                                            ),
                                            Row(children: [
                                              Container(
                                                width: SizedConfig
                                                        .blockSizeHorizontal *
                                                    45,
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "besoin du ${widget.besoins[index].date}", // a dynamiser
                                                        style: new TextStyle(
                                                            fontSize: 15.0,
                                                            color: Colors
                                                                .blue[800]),
                                                      ),
                                                      Text(
                                                        "", // a dynamiser
                                                        style: new TextStyle(
                                                            fontSize: 15.0,
                                                            color: Colors
                                                                .blue[800]),
                                                      ),
                                                    ]),
                                              ),
                                            ]),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: SizedConfig.blockSizeVertical *
                                                0.5,
                                            bottom:
                                                SizedConfig.blockSizeVertical *
                                                    0.5,
                                            left:
                                                SizedConfig.blockSizeVertical *
                                                    2,
                                            right:
                                                SizedConfig.blockSizeVertical *
                                                    2),
                                        decoration: BoxDecoration(
                                          color: widget.besoins[index].statut ==
                                                  true
                                              ? _color1
                                              : _color,
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(15.0),
                                          ),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            widget.besoins[index].statut == true
                                                ? "Affectes"
                                                : "Non affectes",
                                            style: new TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: SizedConfig.blockSizeVertical * 4,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width:
                                              SizedConfig.blockSizeHorizontal *
                                                  45,
                                        ),
                                        Visibility(
                                          visible:
                                              widget.besoins[index].statut ==
                                                      true
                                                  ? false
                                                  : true,
                                          child: GestureDetector(
                                            onTap: () async {
                                              livreur = await UtilisateurService
                                                  .instance
                                                  .getAllLireur();
                                              abonneModel =
                                                  await UtilisateurService
                                                      .instance
                                                      .getAbonneByBesoin(widget
                                                          .besoins[index].id);

                                              print(
                                                  "besoinschoisuit${widget.besoins[index]}");

                                              if (livreur != null &&
                                                  abonneModel != null) {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (_) {
                                                      print(
                                                          "besoinschoisuit${widget.besoins[index]}");
                                                      return Gestionlivreur(
                                                          livreur: livreur,
                                                          abonne: abonneModel,
                                                          besoin: widget
                                                              .besoins[index],
                                                          isaffectation: true,
                                                          userfound:
                                                              widget.userfound);
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  top: SizedConfig
                                                          .blockSizeVertical *
                                                      0.5,
                                                  bottom: SizedConfig
                                                          .blockSizeVertical *
                                                      0.5,
                                                  left: SizedConfig
                                                          .blockSizeVertical *
                                                      2,
                                                  right: SizedConfig
                                                          .blockSizeVertical *
                                                      2),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[800],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  const Radius.circular(20.0),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "Attibuer un livreur",
                                                style: new TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : Text(
                                  "Cet Utilisateur n'a pas encore eu de besoins");
                        }),
                  )
                ]),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Besoins',
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black54,
                ),
                onPressed: () {},
              ),
              actions: <Widget>[
                IconButton(
                  icon: Container(
                    height: 21,
                    width: 21,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.notifications,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            ),
          );
  }
}
