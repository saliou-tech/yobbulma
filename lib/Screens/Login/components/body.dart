import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localstorage/localstorage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Screens/Signup/signup_screen.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/already_have_an_account_acheck.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/Utility/rounded_input_field.dart';
import 'package:project/Utility/rounded_password_field.dart';
import 'package:project/component/Abonne/Inscription/background.dart';
import 'package:project/component/Abonne/profile.dart';
import 'package:project/component/Chef_de_zone/profilChef.dart';
import 'package:project/component/Livreur/profil.dart';
import 'package:project/model/Livraison.dart';
import 'package:project/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../contants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;
  String email;
  String password;
  final LocalStorage storage = new LocalStorage('user');
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  User userfound;
  List<Livraison> livraison;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Yobulma Login"),
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
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
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
                        email = value;
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
                        password = value;
                      });
                    },
                  ),
                  RoundedButton(
                      text: "LOGIN",
                      press: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          Map<String, dynamic> user = {
                            "email": email,
                            "password": password
                          };
                          userfound =
                              await UtilisateurService.instance.Login(user);
                          print(user);
                          if (userfound == null) {
                            setState(() {
                              showSpinner = false;
                            });

                            AwesomeDialog(
                                dialogType: DialogType.ERROR,
                                context: context,
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
                            if (userfound.profile == "abonne") {
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.LEFTSLIDE,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.SUCCES,
                                  title: 'Bienvenue ',
                                  desc:
                                      "Yobbul-ma votre platforme de livraison securisees",
                                  btnOkOnPress: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return Profile(userfound);
                                        },
                                      ),
                                    );
                                  },
                                  btnOkIcon: Icons.check_circle,
                                  onDissmissCallback: () {
                                    /* storage.setItem("currentUser", userfound);

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return Profile(userfound);
                                        },
                                      ),
                                    );*/
                                  })
                                ..show();
                            }
                            if (userfound.profile == "livreur") {
                              print(userfound.profile);
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.LEFTSLIDE,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.SUCCES,
                                  title: 'Bienvenue ',
                                  desc:
                                      "Yobbul-ma votre platforme de livraison securisees",
                                  btnOkOnPress: () async {
                                    livraison = await UtilisateurService
                                        .instance
                                        .getLiraisonByLivreur(userfound.id);

                                    if (livraison == null) {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          print(userfound);
                                          return LiveurProfile(
                                              user: userfound,
                                              livraison: livraison);
                                        },
                                      ),
                                    );
                                  },
                                  btnOkIcon: Icons.check_circle,
                                  onDissmissCallback: () {
                                    /* Navigator.of(context).push(
                                      MaterialPageRoute(

                                        builder: (_) {
                                          return Profile(userfound);
                                        },
                                      ),
                                    );*/
                                  })
                                ..show();
                            }
                            if (userfound.profile == "ChefDeZone") {
                              print(userfound.profile);
                              AwesomeDialog(
                                  context: context,
                                  animType: AnimType.LEFTSLIDE,
                                  headerAnimationLoop: false,
                                  dialogType: DialogType.SUCCES,
                                  title: 'Bienvenue ',
                                  desc:
                                      "Yobbul-ma votre platforme de livraison securisees",
                                  btnOkOnPress: () async {
                                    if (livraison == null) {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) {
                                          print(userfound);
                                          return ProfilChef(
                                            userfound: userfound,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  btnOkIcon: Icons.check_circle,
                                  onDissmissCallback: () {
                                    /* Navigator.of(context).push(
                                      MaterialPageRoute(

                                        builder: (_) {
                                          return Profile(userfound);
                                        },
                                      ),
                                    );*/
                                  })
                                ..show();
                            }
                          }
                        }
                        ;
                      }),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    text: "creer votre compte ? ",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
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
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              text: "creer votre compte ? ",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
