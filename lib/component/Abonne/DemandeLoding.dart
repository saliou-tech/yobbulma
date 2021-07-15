import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/component/Abonne/Inscription/background.dart';
import 'package:project/component/Abonne/profile.dart';
import 'package:project/contants.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/User.dart';

import 'Inscription/or_divider.dart';
import 'home.dart';

class DemandeLoad extends StatefulWidget {
  Map<String, dynamic> besoin;
  User user;
  DemandeLoad({this.besoin, this.user});

  @override
  _DemandeLoadState createState() => _DemandeLoadState();
}

class _DemandeLoadState extends State<DemandeLoad> {
  @override
  bool isBesoinSend = false;
  bool showSpinner = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          color: kSecondaryColor,
          inAsyncCall: showSpinner,
          child: Background(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/yobbulma.png',
                fit: BoxFit.cover,
                width: SizedConfig.blockSizeVertical * 25,
              ),
              SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
              Center(
                  child: Text('Confirmer votre demande...',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: SizedConfig.blockSizeHorizontal * 5.5),
                      textAlign: TextAlign.center)),
              SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
              RoundedButton(
                text: 'confirmer',
                color: kPrimaryColor,
                press: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  Besoin newbesoin = await UtilisateurService.instance
                      .enregistrerBesoin(widget.besoin);
                  print(newbesoin.toString());
                  print("notre new besoin $newbesoin");
                  if (newbesoin != null) {
                    print('lebsoinestnonnulll');
                    setState(() {
                      showSpinner = false;
                    });
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.INFO,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: false,
                        title: 'Info',
                        desc:
                            ' votre besoin est enregistre vous serez affecte à un lireur!!!',
                        btnOkOnPress: () {
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return Profile(widget.user);
                              },
                            ),
                          );
                        },
                        btnOkIcon: Icons.cancel,
                        btnOkColor: kPrimaryColor);
                  } else {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.RIGHSLIDE,
                        headerAnimationLoop: false,
                        title: 'Info',
                        desc:
                            "Oups un probleme est survenue lors de l'envoie...Reessayez!!!",
                        btnOkOnPress: () {
                          setState(() {
                            showSpinner = false;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) {
                                  return Profile(widget.user);
                                },
                              ),
                            );
                          });
                          // showSpinner = false;
                        },
                        btnOkIcon: Icons.cancel,
                        btnOkColor: kPrimaryColor);
                  }
                },
              ),
              OrDivider(),
              RoundedButton(
                text: 'Annuler',
                color: Color(0xFFb33131),
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) {
                        return Profile(widget.user);
                      },
                    ),
                  );
                },
              ),
            ]),
          ),
        ));
  }
}
