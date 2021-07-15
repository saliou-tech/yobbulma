import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:project/Screens/Livreur/Signup/signup_screen.dart';
import 'package:project/Service/utilisateurService.dart';
import 'package:project/component/Abonne/profile.dart';
import 'package:project/contants.dart';
import 'package:project/model/Besoin.dart';
import 'package:project/model/Livreur.dart';
import 'package:project/model/User.dart';

import 'home.dart';

class BesoinOfAbonne extends StatefulWidget {
  Besoin besoin = new Besoin();
  User user = new User();
  BesoinOfAbonne({this.besoin, this.user});
  @override
  _BesoinOfAbonneState createState() => _BesoinOfAbonneState();
}

class IconImgs {
  static const String send = "assets/send.png";
  static const String transfer = "assets/transfer.png";
  static const String passbook = "assets/passbook.png";
  static const String more = "assets/more.png";
  static const String freeze = "assets/freeze.png";
  static const String unlock = "assets/unlock.png";
  static const String secret = "assets/secret.png";
}

class IconColors {
  static const Color send = Colors.greenAccent;
  static const Color transfer = Colors.redAccent;
  static const Color passbook = kPrimaryColor;
  static const Color more = kPrimaryLightColor;
}

class _BesoinOfAbonneState extends State<BesoinOfAbonne> {
  @override
  List<Besoin> receivebesoin;
  bool _isloading = false;
  void initState() {
    super.initState();
    if (receivebesoin == null) {
      _initBesoin();
    }
  }

  _initBesoin() async {
    List<Besoin> newbesoin =
        await UtilisateurService.instance.getBesoinByABonne(widget.user.id);
    print("appelmethode$newbesoin");
    setState(() {
      receivebesoin = newbesoin;
      print("listes ${receivebesoin} ");
    });
  }

  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl = 'assets/yobbulma.png';
    LivreurModel livreur;
    print(widget.besoin);

    setState(() {
      print("newbesoinalue$receivebesoin");
    });

    print(receivebesoin);

    return receivebesoin != null && receivebesoin.length > 0
        ? Scaffold(
            backgroundColor: kPrimaryLightColor,
            appBar: AppBar(
              title: Text(
                'Besoins',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 21.0,
                ),
              ),
              centerTitle: true,
              backgroundColor: kPrimaryColor,
              elevation: 0,
              /*  leading: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black54,
                ),
                onPressed: () {

                },
              ),*/
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
                                return BesoinOfAbonne(
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
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /*  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.grey[300],
                            spreadRadius: 5.0),
                      ],
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(51),
                        bottomLeft: Radius.circular(51),
                      ),
                      color: Colors.white,
                    ),
                    child: Hero(
                      tag: "card",
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          */ /* child: CreditCardContainer(
                            user: widget.user,
                          ),*/ /*
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) {
                                  return Container();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),*/
                  CustomContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomIconButton(
                          circleColor: IconColors.send,
                          buttonImg: "assets/imgs/send.png",
                          buttonTitle: "30 Livraisons",
                          onTap: () {},
                        ),
                        CustomIconButton(
                          circleColor: IconColors.transfer,
                          buttonImg: "assets/imgs/transfer.png",
                          buttonTitle: "15 effectues",
                          onTap: () {},
                        ),
                        CustomIconButton(
                          circleColor: IconColors.passbook,
                          buttonImg: "assets/imgs/passbook.png",
                          buttonTitle: "10 affectes",
                          onTap: () {},
                        ),
                        CustomIconButton(
                          circleColor: IconColors.more,
                          buttonImg: "assets/imgs/more.png",
                          buttonTitle: "5reste",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  CustomContainer(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Mes BESOINS",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            CustomRoundedButton(
                              buttonText: "Etat",
                              color: kPrimaryColor,
                              onTap: () {},
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: receivebesoin.length,
                          itemBuilder: (BuildContext context, int index) {
                            return HistoryListTile(
                                iconColor: receivebesoin[index].statut == true
                                    ? IconColors.send
                                    : IconColors.transfer,
                                onTap: () {},
                                transactionAmount: receivebesoin[index]
                                            .statut ==
                                        true
                                    ? InkWell(
                                        onTap: () async {
                                          livreur = await UtilisateurService
                                              .instance
                                              .getLivreurByBesoin(
                                                  receivebesoin[index].id);
                                          if (livreur != null) {
                                            AwesomeDialog(
                                              context: context,
                                              animType: AnimType.SCALE,
                                              dialogType: DialogType.INFO,
                                              body: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: SizedConfig
                                                              .blockSizeVertical *
                                                          20,
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.all(
                                                          SizedConfig
                                                                  .blockSizeHorizontal *
                                                              3),
                                                      height: SizedConfig
                                                              .blockSizeVertical *
                                                          15,
                                                      width: SizedConfig
                                                              .blockSizeHorizontal *
                                                          30,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          100)),
                                                          border: Border.all(
                                                            color: Colors
                                                                .blue[800],
                                                            width: 2,
                                                          )),
                                                      child: Icon(
                                                        Icons.person,
                                                        color: Colors.blue[800],
                                                        size: 60,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            15),
                                                    Row(children: [
                                                      Container(
                                                        width: SizedConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        child: Text(
                                                          'Nom',
                                                          style: new TextStyle(
                                                              fontSize: 20.0,
                                                              color:
                                                                  kPrimaryColor),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Expanded(
                                                          child: Container(
                                                              width: SizedConfig
                                                                      .blockSizeVertical *
                                                                  33,
                                                              child: Text(
                                                                livreur
                                                                    .nom, // a dynamiser
                                                                style: new TextStyle(
                                                                    fontSize:
                                                                        20.0,
                                                                    color: Colors
                                                                            .blue[
                                                                        200]),
                                                              )),
                                                        ),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            5),
                                                    Row(children: [
                                                      Container(
                                                        width: SizedConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        child: Text(
                                                          'Prenom',
                                                          style: new TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .blue[800]),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                            width: SizedConfig
                                                                    .blockSizeVertical *
                                                                33,
                                                            child: Text(
                                                              livreur
                                                                  .prenom, // a dynamiser
                                                              style: new TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  color: Colors
                                                                          .blue[
                                                                      200]),
                                                            )),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            5),
                                                    Row(children: [
                                                      Container(
                                                        width: SizedConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        child: Text(
                                                          'Telephone',
                                                          style: new TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .blue[800]),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                            width: SizedConfig
                                                                    .blockSizeVertical *
                                                                33,
                                                            child: Text(
                                                              livreur
                                                                  .telephone, // a dynamiser
                                                              style: new TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  color: Colors
                                                                          .blue[
                                                                      200]),
                                                            )),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            5),
                                                    Row(children: [
                                                      Container(
                                                        width: SizedConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        child: Text(
                                                          'Adresse',
                                                          style: new TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .blue[800]),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                            width: SizedConfig
                                                                    .blockSizeVertical *
                                                                33,
                                                            child: Text(
                                                              livreur
                                                                  .adresse, // a dynamiser
                                                              style: new TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  color: Colors
                                                                          .blue[
                                                                      200]),
                                                            )),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            5),
                                                    Row(children: [
                                                      Container(
                                                        width: SizedConfig
                                                                .blockSizeVertical *
                                                            15,
                                                        child: Text(
                                                          'Profile',
                                                          style: new TextStyle(
                                                              fontSize: 20.0,
                                                              color: Colors
                                                                  .blue[800]),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                            width: SizedConfig
                                                                    .blockSizeVertical *
                                                                33,
                                                            child: Text(
                                                              livreur.profile,
                                                              style: new TextStyle(
                                                                  fontSize:
                                                                      20.0,
                                                                  color: Colors
                                                                          .blue[
                                                                      200]),
                                                            )),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                        height: SizedConfig
                                                                .blockSizeHorizontal *
                                                            10),
/*
            Column(children: [
              RoundedButton(
                textColor: Colors.white,
                text: "affecter",
                color: kPrimaryColor,
                press: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  Map<String, dynamic> besoin = {"id": widget.besoins["id"]};
                  Map<String, dynamic> livreur = {"id": widget.livreur.id};
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
                                return ProfilChef();
                              },
                            ),
                          );
                        },
                        btnOkIcon: Icons.check_circle,
                        onDissmissCallback: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) {
                                return ProfilChef();
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
              */
/*FlatButton(
                onPressed: () {
                  if (isDisable == true) {
                    return null;
                  } else {
                    return _showDialog("Vous venez de confirmer la reception");
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(SizedConfig.blockSizeVertical * 1),
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
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Text(
                    "confirmer la reception", // l'etat du besoin passe à 'en cours'
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (isDisable == true) {
                    return null;
                  } else {
                    return _showDialog("Vous venez de rejetter la demande");
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(SizedConfig.blockSizeVertical * 1),
                  decoration: BoxDecoration(
                    color: _color,
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    "Rejeter la demande", // l'etat du besoin passe à 'rejetté'
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),
                  ),
                ),
              )*/ /*

            ])
*/
                                                  ]),
                                                ),
                                              ),
                                              title: 'This is Ignored',
                                              desc: 'This is also Ignored',
                                              btnOkOnPress: () {},
                                            )..show();
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.0, vertical: 7.0),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                color: Colors.greenAccent),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Text(
                                            "Voir Livreur",
                                            style: TextStyle(
                                                color: Colors.greenAccent),
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.0, vertical: 7.0),
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border:
                                                Border.all(color: Colors.red),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: Text(
                                            "En cours ..",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                transactionIcon: IconImgs.transfer,
                                transactionName:
                                    "date ${receivebesoin[index].date}",
                                transactionType:
                                    receivebesoin[index].statut == true
                                        ? "Affectes"
                                        : "Non affectes");
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),

                        /*  children: <Widget>[
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "+\$210.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Amazigh Halzoun",
                        transactionType: "TRANSFER",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.transfer,
                        onTap: () {},
                        transactionAmount: "-\$310.00",
                        transactionIcon: IconImgs.transfer,
                        transactionName: "Cybdom Tech",
                        transactionType: "TRANSFER",
                      ),
                      HistoryListTile(
                        iconColor: IconColors.send,
                        onTap: () {},
                        transactionAmount: "-\$210.00",
                        transactionIcon: IconImgs.send,
                        transactionName: "Wife",
                        transactionType: "SEND",
                      ),
                    ],*/
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Besoins',
                style: TextStyle(
                  color: Colors.black54,
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

class HistoryListTile extends StatelessWidget {
  final Color iconColor;
  final String transactionName, transactionType, transactionIcon;
  final GestureTapCallback onTap;
  final Widget transactionAmount;
  final Color color;
  const HistoryListTile({
    Key key,
    this.iconColor,
    this.transactionName,
    this.transactionType,
    this.transactionAmount,
    this.transactionIcon,
    this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(transactionName),
        subtitle: Text(transactionType),
        trailing: FlatButton(
          child: transactionAmount,
          color: color,
          onPressed: () {},
        ),
        leading: CircleAvatar(
          radius: 25,
          child: Image.asset(
            transactionIcon,
            height: 25,
            width: 25,
          ),
          backgroundColor: iconColor,
        ),
        enabled: true,
        onTap: onTap,
      ),
    );
  }
}

class CustomRoundedButton extends StatelessWidget {
  final Color color;
  final String buttonText;
  final GestureTapCallback onTap;
  CustomRoundedButton({
    @required this.color,
    @required this.buttonText,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 13.0, vertical: 7.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            "More",
            style: TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String buttonTitle, buttonImg;
  final GestureTapCallback onTap;
  final Color circleColor;
  const CustomIconButton({
    @required this.circleColor,
    @required this.buttonTitle,
    @required this.buttonImg,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundColor: circleColor,
                child: Image.asset(
                  buttonImg,
                  height: 19,
                  width: 19,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                buttonTitle,
                overflow: TextOverflow.clip,
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*class CreditCardContainer extends StatelessWidget {
  User user = new User();
  CreditCardContainer({this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 31, vertical: 21),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 5.0, color: kPrimaryLightColor, offset: Offset(0, 5)),
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [kPrimaryLightColor, kPrimaryColor],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                "assets/yobbulma.png",
                color: Colors.white,
                width: 51,
                height: 51,
              ),
            ),
            Text(
              "Abonnement",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 11,
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "VALIDE DE: ",
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                    Text(
                      "09/21",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                SizedBox(
                  width: 21,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "A: ",
                      style: TextStyle(color: Colors.white, fontSize: 11.0),
                    ),
                    Text(
                      "09/23",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              "${user.nom}" " ${user.prenom}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class CustomContainer extends StatelessWidget {
  final Widget child;
  CustomContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 21),
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey[300],
            spreadRadius: 5.0,
          ),
        ],
        borderRadius: BorderRadius.circular(41),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
