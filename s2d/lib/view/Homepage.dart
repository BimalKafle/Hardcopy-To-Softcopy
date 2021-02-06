import 'package:flutter/material.dart';
import './Bodypage.dart';

class Homepg extends StatefulWidget {
  @override
  _HomepgState createState() => _HomepgState();
}

class _HomepgState extends State<Homepg> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: BodyPg(),
    ));
  }
}
