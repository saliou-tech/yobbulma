import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:localstorage/localstorage.dart';
import 'package:project/Screens/Login/login_screen.dart';
import 'package:project/Screens/Signup/signup_screen.dart';
import 'package:project/Utility/rounded_button.dart';

import '../../contants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LocalStorage storage = new LocalStorage('user');

  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    {}
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/yobbulma.png',
            fit: BoxFit.cover,
            width: SizedConfig.blockSizeVertical * 25,
          ),
          SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
          Column(children: [
/*
            Container(
              width: SizedConfig.blockSizeVertical * 25,
              height: SizedConfig.blockSizeHorizontal * 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue[800],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(Icons.person_add,
                          color: Colors.blue[800], size: 40.0),
                    ),
                    SizedBox(height: SizedConfig.blockSizeHorizontal * 5),
                    Text(
                      'Demander un livreur',
                      style: new TextStyle(
                          fontSize: 15.0, color: Colors.black),
                    ),
                  ]),
            ),
*/
/*
            SizedBox(height: SizedConfig.blockSizeHorizontal * 15),
*/
            RoundedButton(
              text: 'SE CONNECTER',
              color: kPrimaryColor,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 3),
            RoundedButton(
              text: 'CREER VOTRE COMPTE',
              color: kPrimaryColor,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      print("salut");
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ])
        ]),
      ),
    );
  }
}

class SizedConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}
