import 'package:flutter/material.dart';
import 'package:project/contants.dart';

import 'component/Abonne/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(primaryColor: kPrimaryLightColor),
      home: Home(),
    );
  }
}
