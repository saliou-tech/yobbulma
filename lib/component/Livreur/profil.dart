import 'package:flutter/material.dart';
import 'package:project/component/Abonne/home.dart';
import 'package:project/model/Livraison.dart';
import 'package:project/model/User.dart';

import 'Demande.dart';
import 'DemandeConfirm.dart';
import 'Modifier.dart';

class LiveurProfile extends StatefulWidget {
  @override
  User user = new User();
  List<Livraison> livraison;
  LiveurProfile({this.user, this.livraison});
  _LiveurProfileState createState() => _LiveurProfileState();
}

class _LiveurProfileState extends State<LiveurProfile> {
  @override
  Widget build(BuildContext context) {
    SizedConfig().init(context);
    {}
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Column(children: [
        Container(
          height: SizedConfig.blockSizeHorizontal * 70,
          child: Column(children: [
            SizedBox(height: SizedConfig.blockSizeHorizontal * 10),
            Row(
              children: <Widget>[
                SizedBox(width: SizedConfig.blockSizeVertical * 2),
                Text('Profile ${widget.user.profile}',
                    style: new TextStyle(fontSize: 27.0, color: Colors.white)),
                SizedBox(width: SizedConfig.blockSizeVertical * 20),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return Modifier();
                        },
                      ),
                    );
                  },
                  child: Icon(Icons.brightness_high,
                      color: Colors.white, size: 40.0),
                ),
                Expanded(
                    child: SizedBox(width: SizedConfig.blockSizeVertical * 2)),
              ],
            ),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 12),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.person, color: Colors.blue[800], size: 45.0)),
            SizedBox(height: SizedConfig.blockSizeHorizontal * 8),
            Row(
              children: <Widget>[
                SizedBox(width: SizedConfig.blockSizeVertical * 2),
                Text('${widget.user.nom}  ${widget.user.prenom}',
                    style: new TextStyle(fontSize: 20.0, color: Colors.white)),
              ],
            )
          ]),
        ),
        Container(
          height: SizedConfig.blockSizeHorizontal * 118,
          color: Colors.blue[200],
          child: DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: Colors.blue[200],
                appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(SizedConfig.blockSizeVertical * 15),
                  child: Container(
                      color: Colors.white,
                      height: SizedConfig.blockSizeHorizontal * 15,
                      child: TabBar(
                        tabs: [
                          Container(
                              child: Row(
                            children: [
                              Text(
                                'Besoins Affectés',
                                style: TextStyle(
                                    color: Colors.blue[800],
                                    fontSize:
                                        SizedConfig.blockSizeHorizontal * 3.1),
                              ),
                              Icon(
                                Icons.description,
                                size: 30,
                                color: Colors.blue[800],
                              )
                            ],
                          )),
                          Container(
                              child: Row(children: [
                            Text(
                              'Demandes Confirmées',
                              style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize:
                                      SizedConfig.blockSizeHorizontal * 3.1),
                            ),
                            Icon(
                              Icons.done_all,
                              size: 30,
                              color: Colors.blue[800],
                            )
                          ]))
                        ],
                      )),
                ),
                body: TabBarView(children: [
                  Demande(widget.livraison),
                  DemandeConfirm(widget.livraison)
                ]),
              )),
        ),
        SizedBox(
          height: SizedConfig.blockSizeVertical * 1,
        ),
        Expanded(
          child: Container(
              color: Colors.blue[200],
              child: Row(
                children: [
                  SizedBox(
                    width: SizedConfig.blockSizeHorizontal * 80,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) {
                              return Home();
                            },
                          ),
                        );
                      },
                      child: Container(
                        width: SizedConfig.blockSizeVertical * 8,
                        height: SizedConfig.blockSizeHorizontal * 15,
                        decoration: BoxDecoration(
                          color: Colors.blue[800],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[800],
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                                padding: const EdgeInsets.all(5),
                                child: Icon(Icons.exit_to_app,
                                    color: Colors.white, size: 20.0),
                              ),
                              Expanded(
                                child: Text(
                                  'Deconnexion',
                                  style: new TextStyle(
                                      fontSize: 7.0, color: Colors.white),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              )),
        )
      ]),
    );
  }
}
