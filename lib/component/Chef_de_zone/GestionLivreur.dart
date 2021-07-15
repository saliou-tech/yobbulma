import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/component/Livreur/DetailsDemande.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

import '../../contants.dart';

class Gestionlivreur extends StatefulWidget {
  List<LivreurModel> livreur;
  bool isaffectation;
  AbonneModel abonne;
  User userfound;
  Besoin besoin;
  Gestionlivreur(
      {this.livreur,
      this.abonne,
      this.besoin,
      this.isaffectation,
      this.userfound});

  @override
  _GestionlivreurState createState() => _GestionlivreurState();
}

class _GestionlivreurState extends State<Gestionlivreur> {
  @override
  Widget build(BuildContext context) {
    print(widget.besoin);
    return widget.abonne != null ||
            widget.livreur != null ||
            widget.livreur.length > 0 ||
            widget.besoin != null
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Text('Affectation'),
            ),
            backgroundColor: Colors.white,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 15,
                  ),
                  widget.isaffectation == true
                      ? Text(
                          "Affecter à un Livreur",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.blue[800]),
                        )
                      : Text(
                          "Liste des Livreurs",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.blue[800]),
                        ),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 5,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: widget.livreur.length,
                      reverse: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(children: [
                          Container(
                            margin: EdgeInsets.all(
                                SizedConfig.blockSizeHorizontal * 3),
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
                              size: 50,
                            ),
                          ),
                          Container(
                            height: SizedConfig.blockSizeVertical * 13,
                            width: SizedConfig.blockSizeHorizontal * 60,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blue[800],
                                  width: 2,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return DetailleDemande(
                                          livreur: widget.livreur[index],
                                          abonne: widget.abonne,
                                          besoin: widget.besoin,
                                          userfound: widget.userfound);
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: SizedConfig.blockSizeVertical * 4,
                                  ),
                                  Row(children: [
                                    Container(
                                      width:
                                          SizedConfig.blockSizeHorizontal * 45,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${widget.livreur[index].nom}", // a dynamiser
                                              style: new TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.blue[800]),
                                            ),
                                            Text(
                                              "${widget.livreur[index].prenom}", // a dynamiser
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
                                  Container(
                                    width: SizedConfig.blockSizeHorizontal * 55,
                                    child: Text(
                                      "${widget.livreur[index].telephone}", // a dynamiser
                                      style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.blue[300]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Column(children: [
                              Container(
                                margin: EdgeInsets.all(
                                    SizedConfig.blockSizeHorizontal * 3),
                                height: SizedConfig.blockSizeVertical * 5,
                                width: SizedConfig.blockSizeHorizontal * 10,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    border: Border.all(
                                      color: Colors.red[900],
                                      width: 2,
                                    )),
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red[900],
                                  size: 25,
                                ),
                              ),
                            ]),
                          )
                        ]);
                      }),
                  SizedBox(
                    height: SizedConfig.blockSizeVertical * 4,
                  ),
                ]),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Liste Livreur',
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
