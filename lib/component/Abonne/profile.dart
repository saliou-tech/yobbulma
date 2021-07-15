import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:project/Screens/Livreur/Signup/signup_screen.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/contants.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/User.dart';

import 'BesoinsDunAbonne.dart';
import 'home.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  User user = new User();
  Profile(this.user);

  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showSpinner = false;
  Besoin besoin = new Besoin();

  String getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    setState(() {
      besoin.date = formattedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'assets/yobbulma.png';

    return Stack(
      children: <Widget>[
        Container(),
        Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        ModalProgressHUD(
          color: kPrimaryColor,
          inAsyncCall: showSpinner,
          child: Scaffold(
              appBar: AppBar(
                title: Text("Profile"),
                centerTitle: false,
                elevation: 0.0,
                backgroundColor: kPrimaryColor,
              ),
              drawer: Drawer(
                child: Container(
/*
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  )),
*/
                  //  color: Color(0xFFbb4e49),
                  child: ListView(
                    // itemExtent: 5,
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.scaleDown,
                        )),
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(widget.user)),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'Home',
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Icon(
                                Icons.arrow_upward,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'Inscription',
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Icon(
                                Icons.account_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                'Connexion',
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Icon(
                                Icons.account_circle,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              "Renouveler le type d'abonnement",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            trailing: Icon(
                              Icons.payment,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return BesoinsDunAbonne(
                                    user: widget.user,
                                  );
                                }),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                "MES BESOINS",
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Contactez nous',
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Icon(
                              Icons.contacts,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            },
                            child: ListTile(
                              title: Text(
                                "Deconnexion",
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: Icon(
                                Icons.shopping_cart,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 190.0,
                        color: Colors.transparent,
                      ),
/*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          final url =
                              'https://web.facebook.com/kabakamultimediaent/';
                          _launchInBrowser(url);
                        },
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final url = 'https://www.instagram.com/kabakamment/';
                          _launchInBrowser(url);
                        },
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Color(0xFFF77737),
                            size: 40.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final url = 'https://twitter.com/KabakaMMENT';
                          _launchInBrowser(url);
                        },
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.twitter,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          final url =
                              'https://www.youtube.com/channel/AIzaSyBqFn-hYWykGSvYmuKyIeTyBS_3-a9Ppxk/videos';
                          _launchInBrowser(url);
                        },
                        child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.youtube,
                            color: Colors.red,
                            size: 40.0,
                          ),
                        ),
                      ),
                    ],
                  )
*/
                    ],
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: _height / 12,
                    ),
                    Image.asset(
                      'assets/yobbulma.png',
                      fit: BoxFit.cover,
                      width: SizedConfig.blockSizeVertical * 25,
                    ),
/*
                    CircleAvatar(
                        radius: _width < _height ? _width / 3 : _height / 3,
                        backgroundImage: AssetImage(imgUrl),
                        backgroundColor: Colors.white),
*/
                    SizedBox(
                      height: _height / 25.0,
                    ),
                    Text(
                      widget.user.nom + " " + widget.user.prenom,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width / 15,
                          color: kPrimaryColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: _height / 30,
                          left: _width / 8,
                          right: _width / 8),
                      child: Text(
                        "Bienvenue, ${widget.user.nom + " " + widget.user.prenom} .\nDans votre platforme de livraison ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: _width / 25,
                            color: kPrimaryColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Divider(
                      height: _height / 30,
                      color: kPrimaryColor,
                    ),
                    Row(
                      children: <Widget>[
                        rowCell(30, 'Liraisons'),
                        rowCell(15, 'Effectues'),
                        rowCell(15, 'Restants'),
                      ],
                    ),
                    Divider(height: _height / 30, color: kPrimaryColor),
                    SizedBox(
                      height: _height / 15,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: _width / 8, right: _width / 8),
                      child: RoundedButton(
                        color: kPrimaryColor,
                        text: 'DEMANDER UN LIVREUR',
                        press: () async {
                          setState(() {
                            showSpinner = true;
                          });

                          this.getCurrentDate();
                          Map<String, dynamic> abonne = {"id": widget.user.id};
                          Map<String, dynamic> besoin = {
                            "date": this.besoin.date,
                            "statut": false,
                            "abonne": abonne
                          };

                          Besoin newbesoin = await UtilisateurService.instance
                              .enregistrerBesoin(besoin);
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
                                        return BesoinsDunAbonne(
                                            besoin: newbesoin,
                                            user: widget.user);
                                      },
                                    ),
                                  );
                                },
                                btnOkIcon: Icons.cancel,
                                btnOkColor: kPrimaryColor)
                              ..show();
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
                                          return BesoinsDunAbonne(
                                            besoin: newbesoin,
                                            user: widget.user,
                                          );
                                        },
                                      ),
                                    );
                                  });
                                  // showSpinner = false;
                                },
                                btnOkIcon: Icons.cancel,
                                btnOkColor: kPrimaryColor)
                              ..show();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          Text(
            '$count',
            style: new TextStyle(color: kPrimaryColor),
          ),
          Text(type,
              style: new TextStyle(
                  color: kPrimaryColor, fontWeight: FontWeight.normal))
        ],
      ));
}
