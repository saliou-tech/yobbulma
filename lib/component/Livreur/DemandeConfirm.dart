import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livraison.dart';

import '../../contants.dart';

class DemandeConfirm extends StatefulWidget {
  List<Livraison> livraison;
  DemandeConfirm(this.livraison);
  @override
  _DemandeConfirmState createState() => _DemandeConfirmState();
}

class _DemandeConfirmState extends State<DemandeConfirm> {
  @override
  bool showSpinner = false;
  Widget build(BuildContext context) {
    Color _color = Colors.blue[800];
    bool isDisable = false;

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
                  _color = Colors.white;
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

    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        itemCount: widget.livraison.length,
        itemBuilder: (BuildContext context, int index) {
          Besoin besoin;
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
                Visibility(
                  visible: widget.livraison[index].besoin['statut'] == true
                      ? false
                      : true,
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizedConfig.blockSizeHorizontal * 45,
                      ),
                      ModalProgressHUD(
                        color: kPrimaryColor,
                        inAsyncCall: showSpinner,
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            widget.livraison[index].besoin["statut"] = true;
                            besoin = await UtilisateurService.instance
                                .confirmerLivraison(
                                    widget.livraison[index].besoin,
                                    widget.livraison[index].besoin["id"]);
                            if (besoin == null) {
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
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: false,
                                  title: 'Confirmation',
                                  desc: ' Livraison confirmees avec succces!!!',
                                  btnOkOnPress: () {
                                    showSpinner = false;
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.green)
                                ..show();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                SizedConfig.blockSizeVertical * 2),
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
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              "Confirmer la livraison",
                              style: new TextStyle(
                                  fontSize: 15.0, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.livraison[index].besoin['statut'] == true
                      ? true
                      : false,
                  child: Row(
                    children: [
                      SizedBox(
                        width: SizedConfig.blockSizeHorizontal * 45,
                      ),
                      GestureDetector(
                        onTap: () async {
                          AwesomeDialog(
                              context: context,
                              dialogType: DialogType.INFO,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: false,
                              title: 'Confirmation',
                              desc: ' Commande déja Confirmes!!!',
                              btnOkOnPress: () {
                                showSpinner = false;
                              },
                              btnOkIcon: Icons.cancel,
                              btnOkColor: Colors.green)
                            ..show();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(SizedConfig.blockSizeVertical * 2),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(20.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.greenAccent.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Text(
                            "Déja Confirmes",
                            style: new TextStyle(
                                fontSize: 15.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]);
        },
      ),
    );
  }
}
