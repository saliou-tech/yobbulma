import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children : [
          SizedBox(
            height: SizedConfig.blockSizeHorizontal * 30
          ),
          //les informations du livreur
          Container(
            width: SizedConfig.blockSizeVertical * 40 ,
            height: SizedConfig.blockSizeHorizontal * 100 ,
            margin : EdgeInsets.only(left:SizedConfig.blockSizeHorizontal * 10),
            padding: EdgeInsets.all(SizedConfig.blockSizeHorizontal * 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children : [
                Text(
                  'Voici les coordonnées du livreur qui vous a été affecté',
                  style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                  textAlign: TextAlign.center
                ),
                SizedBox(
                  height: SizedConfig.blockSizeHorizontal * 5
                ),
                Row(
                  children : [
                    Text(
                      'Nom',
                      style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                    ),
                    SizedBox(
                      width: SizedConfig.blockSizeVertical * 5
                    ),
                    Text(
                      'Ndiaye',
                      style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                    )
                  ]
                ),
                SizedBox(
                  height: SizedConfig.blockSizeHorizontal * 5
                ),
                Row(
                  children : [
                    Text(
                      'Prenom',
                      style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                    ),
                    SizedBox(
                      width: SizedConfig.blockSizeVertical * 3
                    ),
                    Text(
                      'Moussa',
                      style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                    )
                  ]
                ),
                SizedBox(
                  height: SizedConfig.blockSizeHorizontal * 3
                ),
                Row(
                  children : [
                    Text(
                      'Telephone',
                      style: new TextStyle(fontSize: 20.0, color: Colors.blue[800]),
                    ),
                    SizedBox(
                      width: SizedConfig.blockSizeVertical * 3
                    ),
                    Text(
                      '77 777 77 77',
                      style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                    )
                  ]
                ),
              ]
            ),
          )
        ]
      )  
    );
  }
}