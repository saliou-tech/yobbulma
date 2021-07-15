import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/Screens/Login/login_screen.dart';
import 'package:project/Utility/rounded_button.dart';
import 'package:project/component/Abonne/home.dart';

import '../contants.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    {}
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/yobbulma.png',
            fit: BoxFit.cover,
            width: SizeConfig.blockSizeVertical * 25,
          ),
          SizedBox(height: SizeConfig.blockSizeHorizontal * 15),
          SizedBox(height: SizeConfig.blockSizeHorizontal * 10),
          RoundedButton(
            text: 'Vous etes un Abonne',
            color: kPrimaryColor,
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return Home();
                  },
                ),
              );
            },
          ),
          SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
          RoundedButton(
            text: 'Vous etes un Livreur',
            color: kPrimaryLightColor,
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return LoginScreen(); // doit mener vers la page de connexion du livreur
                  },
                ),
              );
            },
          ),
          SizedBox(height: SizeConfig.blockSizeHorizontal * 5),
          RoundedButton(
            text: 'Vous etes un Chef De Zone',
            color: kSecondaryColor,
            press: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) {
                    return Container();
                  },
                ),
              );
            },
          ),
        ])));
  }
}

class SizeConfig {
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
