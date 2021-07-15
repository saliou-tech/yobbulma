import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/component/Chef_de_zone/profilChef.dart';
import 'package:project/contants.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livraison.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

class DetailleDemande extends StatefulWidget {
  AbonneModel abonne;
  User userfound;
  LivreurModel livreur;
  Besoin besoin;
  DetailleDemande({this.livreur, this.abonne, this.besoin, this.userfound});
  @override
  _DetailleDemandeState createState() => _DetailleDemandeState();
}

class _DetailleDemandeState extends State<DetailleDemande> {
  @override
  bool showSpinner = false;

  Livraison newlivraison;
  Widget build(BuildContext context) {
    Color _color = Colors.blue[800];
    bool isDisable = false; // pour bloquer le boutton une fois avoir quitter

    void _showDialog(text) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            content: new Text(
              text,
              style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  _color = Colors.grey;
                  print(_color);
                  isDisable = true;
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return widget.besoin != null && widget.livreur != null
        ? ModalProgressHUD(
            color: kPrimaryColor,
            inAsyncCall: showSpinner,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: kPrimaryColor,
                title: Text('Detaille de la Demande'),
              ),
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    SizedBox(
                      height: SizedConfig.blockSizeVertical * 1,
                    ),
                    Container(
                      margin:
                          EdgeInsets.all(SizedConfig.blockSizeHorizontal * 3),
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
                          style: new TextStyle(
                              fontSize: 20.0, color: kPrimaryColor),
                        ),
                      ),
                      Expanded(
                        child: Expanded(
                          child: Container(
                              width: SizedConfig.blockSizeVertical * 33,
                              child: Text(
                                widget.livreur.prenom, // a dynamiser
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
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.blue[800]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            width: SizedConfig.blockSizeVertical * 33,
                            child: Text(
                              widget.livreur.nom, // a dynamiser
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
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.blue[800]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            width: SizedConfig.blockSizeVertical * 33,
                            child: Text(
                              widget.livreur.telephone, // a dynamiser
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
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.blue[800]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            width: SizedConfig.blockSizeVertical * 33,
                            child: Text(
                              widget.livreur.adresse, // a dynamiser
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
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.blue[800]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                            width: SizedConfig.blockSizeVertical * 33,
                            child: Text(
                              widget.besoin.date,
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.blue[200]),
                            )),
                      ),
                    ]),
                    SizedBox(height: SizedConfig.blockSizeHorizontal * 10),
                    Expanded(
                      child: Column(children: [
                        RoundedButton(
                          textColor: Colors.white,
                          text: "affecter",
                          color: kPrimaryColor,
                          press: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            Map<String, dynamic> besoin = {
                              "id": widget.besoin.id
                            };
                            Map<String, dynamic> livreur = {
                              "id": widget.livreur.id
                            };
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
                                          return ProfilChef(
                                            userfound: widget.userfound,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  btnOkIcon: Icons.check_circle,
                                  onDissmissCallback: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return ProfilChef(
                                            userfound: widget.userfound,
                                          );
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
                      ]),
                    )
                  ]),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Detaille de la demande',
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
