import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Screens/Login/login_screen.dart';
import 'package:project/Screens/Signup/components/social_icon.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/already_have_an_account_acheck.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/Utility/rounded_input_field.dart';
import 'package:project/Utility/rounded_password_field.dart';
import 'package:project/component/Abonne/Inscription/background.dart';
import 'package:project/component/Abonne/paiement.dart';
import 'package:project/contants.dart';
import 'package:project/model/Abonne.dart';
import 'package:project/model/Aonnement.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  AbonneModel abonne = new AbonneModel();
  AbonnementModel abonnement = new AbonnementModel();
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Yobulma Inscription')),
      ),
      body: ModalProgressHUD(
        color: kPrimaryColor,
        inAsyncCall: showSpinner,
        child: Background(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Entrez votre nom",
                    icon: Icons.person,
                    // ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      // ignore: missing_return
                      setState(() {
                        this.abonne.nom = value;
                        print(value);
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "entrez votre prenom",
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'entrer votre prenom';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.prenom = value;
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "entrer votre  Email",
                    icon: Icons.email,
                    validator: (String value) {
                      if (!EmailValidator.validate(value)) {
                        return 'veuillez renseigner un email valid!!!';
                      }
                      if (value.isEmpty) {
                        return 'veuillez renseigner votre mail';
                      }

                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.email = value;
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "entrer votre numero  de telephone",
                    icon: Icons.phone,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter votre numero de telephone';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.telephone = value;
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "entrer votre Adresse",
                    icon: Icons.location_city,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first adressse';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.adresse = value;
                      });
                    },
                  ),
                  RoundedInputField(
                    hintText: "entrer votre Zone",
                    icon: Icons.location_city,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'veuillez renseigner votr zone';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.Zone = value;
                      });
                    },
                  ),
                  RoundedPasswordField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'renseigner votre mot de passe';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        this.abonne.password = value;
                      });
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    text: "choisissez votre type d'abonnement",
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  Divider(),
                  SizedBox(height: size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocalIcon(
                        iconSrc: "assets/icons/font.svg",
                        press: () {
                          return AwesomeDialog(
                              context: context,
                              animType: AnimType.LEFTSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.SUCCES,
                              title: 'Abonnement A',
                              desc:
                                  "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 3 km ..Veilleuz continuer et passer au paiement",
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                                this.abonnement.intitule = 'A';
                                //print(nomAbonnement);
                              },
                              btnOkIcon: Icons.check_circle,
                              onDissmissCallback: () {
                                debugPrint('Dialog Dissmiss from callback');
                              })
                            ..show();
                        },
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/bold.svg",
                        press: () {
                          return AwesomeDialog(
                              context: context,
                              animType: AnimType.LEFTSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.SUCCES,
                              title: 'Abonnement B',
                              desc:
                                  "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 6 km ..Veilleuz continuer et passer au paiement",
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                                this.abonnement.intitule = 'B';
                                // print(nomAbonnement);
                              },
                              btnOkIcon: Icons.check_circle,
                              onDissmissCallback: () {
                                debugPrint('Dialog Dissmiss from callback');
                              })
                            ..show();
                        },
                      ),
                      SocalIcon(
                        iconSrc: "assets/icons/copyright.svg",
                        press: () {
                          AwesomeDialog(
                              context: context,
                              animType: AnimType.LEFTSLIDE,
                              headerAnimationLoop: false,
                              dialogType: DialogType.SUCCES,
                              title: 'Abonnement C',
                              desc:
                                  "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 9 km ..Veilleuz continuer et passer au paiement",
                              btnOkOnPress: () {
                                debugPrint('OnClcik');
                                this.abonnement.intitule = 'C';
                                //  print(nomAbonnement);
                              },
                              btnOkIcon: Icons.check_circle,
                              onDissmissCallback: () {
                                debugPrint('Dialog Dissmiss from callback');
                              })
                            ..show();
                        },
                      ),
                    ],
                  ),
                  RoundedButton(
                      text: "CONTINUER",
                      press: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Map<String, dynamic> abonne = {
                            "nom": this.abonne.nom,
                            "prenom": this.abonne.prenom,
                            "Zone": this.abonne.Zone,
                            "adresse": this.abonne.adresse,
                            "profile": "abonne",
                            "email": this.abonne.email,
                            "telephone": this.abonne.telephone,
                            "isAbonnementDone": false,
                            "password": this.abonne.password
                          };

                          Map<String, dynamic> abonnement = {
                            "intitule": this.abonnement.intitule,
                            "prix": 600.0
                          };
                          Map<String, dynamic> NouveauAbonne = {
                            "abonne": abonne,
                            "abonnement": abonnement,
                          };
                          String resultat = await UtilisateurService.instance
                              .enregistrerUnNouveauAbonne(NouveauAbonne);
                          print(resultat);
                          if (resultat == null) {
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
                                title: 'Abonne et Abonnement enregistres',
                                desc:
                                    "Abonne et Abonnement enregistre !!passez au paiement",
                                btnOkOnPress: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return Paiement(abonne, abonnement);
                                      },
                                    ),
                                  );
                                },
                                btnOkIcon: Icons.check_circle,
                                onDissmissCallback: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        return Paiement(abonne, abonnement);
                                      },
                                    ),
                                  );
                                })
                              ..show();
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class Body extends StatelessWidget {
  AbonneModel abonne = new AbonneModel();
  AbonnementModel abonnement = new AbonnementModel();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String nomAbonnement = "";
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            */
/* Text(
              "Yobulma Inscription",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),*/ /*

*/
/*
            SizedBox(height: size.height * 0.03),
*/ /*

*/
/*
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.1,
            ),
*/ /*

            RoundedInputField(
              hintText: "Entrez votre nom",
              icon: Icons.person,
              onChanged: (value) {
                this.abonne.nom = value;
              },
            ),
            RoundedInputField(
              hintText: "entrez votre prenom",
              onChanged: (value) {
                this.abonne.prenom = value;
              },
            ),
            RoundedInputField(
              hintText: "entrer votre  Email",
              icon: Icons.email,
              onChanged: (value) {
                this.abonne.email = value;
              },
            ),
            RoundedInputField(
              hintText: "entrer votre numero  de telephone",
              icon: Icons.phone,
              onChanged: (value) {
                this.abonne.telephone = value;
              },
            ),
            RoundedInputField(
              hintText: "entrer votre Adresse",
              icon: Icons.location_city,
              onChanged: (value) {
                this.abonne.adresse = value;
              },
            ),
            RoundedInputField(
              hintText: "entrer votre Zone",
              icon: Icons.location_city,
              onChanged: (value) {
                this.abonne.Zone = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                this.abonne.password = value;
              },
            ),

*/
/*
            SizedBox(height: size.height * 0.03),
*/ /*

            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            Divider(),
*/
/*
            SizedBox(height: size.height * 0.03),
*/ /*

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/font.svg",
                  press: () {
                    return AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        title: 'Abonnement A',
                        desc:
                            "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 3 km ..Veilleuz continuer et passer au paiement",
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                          this.abonnement.intitule = 'A';
                          print(nomAbonnement);
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          debugPrint('Dialog Dissmiss from callback');
                        })
                      ..show();
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/bold.svg",
                  press: () {
                    return AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        title: 'Abonnement B',
                        desc:
                            "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 6 km ..Veilleuz continuer et passer au paiement",
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                          this.abonnement.intitule = 'B';
                          print(nomAbonnement);
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          debugPrint('Dialog Dissmiss from callback');
                        })
                      ..show();
                  },
                ),
                SocalIcon(
                  iconSrc: "assets/icons/copyright.svg",
                  press: () {
                    AwesomeDialog(
                        context: context,
                        animType: AnimType.LEFTSLIDE,
                        headerAnimationLoop: false,
                        dialogType: DialogType.SUCCES,
                        title: 'Abonnement C',
                        desc:
                            "Vous allez beneficier de 30  livraison le mois autour d'une zone de moins de 9 km ..Veilleuz continuer et passer au paiement",
                        btnOkOnPress: () {
                          debugPrint('OnClcik');
                          this.abonnement.intitule = 'C';
                          print(nomAbonnement);
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          debugPrint('Dialog Dissmiss from callback');
                        })
                      ..show();
                  },
                ),
              ],
            ),
            RoundedButton(
              text: "CONTINUER",
              press: () async {
                Map<String, dynamic> Abonne = {
                  "nom": this.abonne.nom,
                  "prenom": this.abonne.prenom,
                  "Zone": this.abonne.Zone,
                  "adresse": this.abonne.adresse,
                  "profil": "abonne",
                  "email": this.abonne.email,
                  "telephone": this.abonne.telephone,
                  "isAbonnementDone": false,
                };

                Map<String, dynamic> Abonnement = {
                  "intitule": this.abonnement.intitule,
                  "prix": this.abonnement.prix,
                };
                Map<String, dynamic> NouveauAbonne = {
                  "abonne": Abonne,
                  "abonnement": Abonnement,
                };
                String resultat = await UtilisateurService.instance
                    .enregistrerUnNouveauAbonne(NouveauAbonne);
                print(resultat);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return Paiement(Abonne, Abonnement);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/
