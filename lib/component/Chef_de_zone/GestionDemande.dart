import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/component/Livreur/DetailsDemande.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/User.dart';

class GestionDemande extends StatefulWidget {
  List<AbonneModel> abonne;
  User userfound;
  GestionDemande(this.abonne, this.userfound);

  @override
  _GestionDemandeState createState() => _GestionDemandeState();
}

class _GestionDemandeState extends State<GestionDemande> {
  @override
  Widget build(BuildContext context) {
    Color _color = Colors.greenAccent[700];
    var badge = "non affecte"; //etats
    bool _visible = false; // pour cacher ou montrer le boutton
    var texte;

    // les etats
    switch (badge) {
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
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: SizedConfig.blockSizeVertical * 10,
        ),
        Text(
          "Liste des abonnés",
          style: new TextStyle(fontSize: 28.0, color: Colors.blue[800]),
        ),
        SizedBox(
          height: SizedConfig.blockSizeVertical * 5,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              reverse: true,
              itemCount: widget.abonne.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Row(children: [
                      Container(
                        margin:
                            EdgeInsets.all(SizedConfig.blockSizeHorizontal * 3),
                        height: SizedConfig.blockSizeVertical * 7,
                        width: SizedConfig.blockSizeHorizontal * 14,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(
                              color: Colors.blue[800],
                              width: 2,
                            )),
                        child: Icon(
                          Icons.person,
                          color: Colors.blue[800],
                          size: 40,
                        ),
                      ),
                      Container(
                        height: SizedConfig.blockSizeVertical * 12,
                        width: SizedConfig.blockSizeHorizontal * 50,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.abonne[index].nom, // a dynamiser
                                        style: new TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.blue[800]),
                                      ),
                                      Text(
                                        widget.abonne[index]
                                            .prenom, // a dynamiser
                                        style: new TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.blue[800]),
                                      ),
                                    ]),
                              ),
                            ]),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: SizedConfig.blockSizeVertical * 0.5,
                              bottom: SizedConfig.blockSizeVertical * 0.5,
                              left: SizedConfig.blockSizeVertical * 2,
                              right: SizedConfig.blockSizeVertical * 2),
                          /* child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return BesoinByAbonnes(


                                      */ /*    widget.abonne[index],
                                          widget.userfound);*/ /*
                                    },
                                  ),
                                );
                              },
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return BesoinByAbonnes(
                                          */ /*  widget.abonne[index],
                                            widget.userfound);*/ /*
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 13.0, vertical: 7.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    border:
                                        Border.all(color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Text(
                                    "Voir besoins",
                                    style: TextStyle(color: Colors.greenAccent),
                                  ),
                                ),
                              )),*/
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 4,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: SizedConfig.blockSizeHorizontal * 45,
                        ),
                        Visibility(
                          visible: false,
                          child: GestureDetector(
                            onTap: () => {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return DetailleDemande();
                                  },
                                ),
                              )
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: SizedConfig.blockSizeVertical * 0.5,
                                  bottom: SizedConfig.blockSizeVertical * 0.5,
                                  left: SizedConfig.blockSizeVertical * 2,
                                  right: SizedConfig.blockSizeVertical * 2),
                              decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(20.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Text(
                                "Attibuer un livreur",
                                style: new TextStyle(
                                    fontSize: 15.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
        )
      ]),
    );
  }
}
