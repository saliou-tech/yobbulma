import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Screens/Livreur/Signup/signup_screen.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/component/Chef_de_zone/GestionLivreur.dart';
import 'package:project/component/Chef_de_zone/Modifier.dart';
import 'package:project/component/Chef_de_zone/besoinByAbonne.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

import '../../contants.dart';

class ProfilChef extends StatefulWidget {
  User userfound;
  ProfilChef({this.userfound});
  @override
  _ProfilChefState createState() => _ProfilChefState();
}

class _ProfilChefState extends State<ProfilChef> {
  @override
  List<LivreurModel> livreur;
  List<AbonneModel> abonne;
  List<Besoin> besoins;

  Widget build(BuildContext context) {
    SizedConfig().init(context);
    {}
    return widget.userfound != null
        ? Scaffold(
            body: Column(children: [
              Container(
                color: Colors.blue[800],
                height: SizedConfig.blockSizeHorizontal * 80,
                child: Column(children: [
                  SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
                  Row(
                    children: <Widget>[
                      SizedBox(width: SizedConfig.blockSizeVertical * 2),
                      Text('Chef de zone',
                          style: new TextStyle(
                              fontSize: 30.0, color: Colors.white)),
                      SizedBox(width: SizedConfig.blockSizeVertical * 15),
                      Icon(Icons.brightness_high,
                          color: Colors.white, size: 40.0),
                    ],
                  ),
                  SizedBox(height: SizedConfig.blockSizeHorizontal * 12),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.person,
                          color: Colors.blue[800], size: 45.0)),
                  SizedBox(height: SizedConfig.blockSizeHorizontal * 12),
                  Row(
                    children: <Widget>[
                      SizedBox(width: SizedConfig.blockSizeVertical * 2),
                      Text("${widget.userfound.nom}+${widget.userfound.prenom}",
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                      SizedBox(width: SizedConfig.blockSizeVertical * 10),
                      Text(widget.userfound.profile,
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white)),
                      SizedBox(width: SizedConfig.blockSizeVertical * 2),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return Modifier();
                                },
                              ),
                            );
                          },
                          child: Icon(Icons.edit,
                              color: Colors.white, size: 45.0)),
                    ],
                  )
                ]),
              ),
              Expanded(
                child: Container(
                    color: Colors.white,
                    height: SizedConfig.blockSizeHorizontal * 127.5,
                    child: Column(children: [
                      SizedBox(height: SizedConfig.blockSizeHorizontal * 10),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizedConfig.blockSizeVertical * 1.5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return SignUpScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: SizedConfig.blockSizeVertical * 20,
                              height: SizedConfig.blockSizeHorizontal * 40,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(Icons.person_add,
                                          color: Colors.white, size: 30.0),
                                    ),
                                    SizedBox(
                                        height:
                                            SizedConfig.blockSizeHorizontal *
                                                5),
                                    Text(
                                      'Inscrire un Livreur',
                                      style: new TextStyle(
                                          fontSize: 13.0, color: Colors.white),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: SizedConfig.blockSizeVertical * 5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              livreur = await UtilisateurService.instance
                                  .getAllLireur();
                              if (livreur != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return Gestionlivreur(
                                        livreur: livreur,
                                        isaffectation: false,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: SizedConfig.blockSizeVertical * 20,
                              height: SizedConfig.blockSizeHorizontal * 40,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(Icons.brightness_high,
                                          color: Colors.white, size: 30.0),
                                    ),
                                    SizedBox(
                                        height:
                                            SizedConfig.blockSizeHorizontal *
                                                5),
                                    Text(
                                      'Gestion des livreurs',
                                      style: new TextStyle(
                                          fontSize: 13.0, color: Colors.white),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: SizedConfig.blockSizeHorizontal * 10),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: SizedConfig.blockSizeVertical * 1.5,
                          ),
                          GestureDetector(
                            onTap: () async {
                              besoins = await UtilisateurService.instance
                                  .getAllBesoins();
                              print(besoins);
                              if (besoins != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return BesoinByAbonnes(
                                        besoins: besoins,
                                        userfound: widget.userfound,
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: SizedConfig.blockSizeVertical * 20,
                              height: SizedConfig.blockSizeHorizontal * 40,
                              decoration: BoxDecoration(
                                color: Colors.blue[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
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
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Icon(Icons.crop_free,
                                          color: Colors.white, size: 30.0),
                                    ),
                                    SizedBox(
                                        height:
                                            SizedConfig.blockSizeHorizontal *
                                                5),
                                    Text(
                                      'Besoins abonnés',
                                      style: new TextStyle(
                                          fontSize: 13.0, color: Colors.white),
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            width: SizedConfig.blockSizeVertical * 5,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) {
                                      return Home();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                width: SizedConfig.blockSizeVertical * 20,
                                height: SizedConfig.blockSizeHorizontal * 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue[200],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
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
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue[200],
                                          border: Border.all(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Icon(Icons.exit_to_app,
                                            color: Colors.white, size: 30.0),
                                      ),
                                      SizedBox(
                                          height:
                                              SizedConfig.blockSizeHorizontal *
                                                  5),
                                      Text(
                                        'Deconnexion',
                                        style: new TextStyle(
                                            fontSize: 13.0,
                                            color: Colors.white),
                                      ),
                                    ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ])),
              )
            ]),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'ChefDeZone',
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
    ;
  }
}
