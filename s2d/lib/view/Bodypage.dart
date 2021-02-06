import 'package:flutter/material.dart';

import 'Softview.dart';

class BodyPg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[500],
                      radius: 52,
                      child: CircleAvatar(
                        child: Icon(Icons.camera, size: 45),
                        radius: 50,
                      ), //CircleAvatar
                    ), //CirclAvatar
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Convert Your Hardcopy into Softcopy',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text

                    //SizedBox
                    SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConvertS()),
                          );
                        },
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(Icons.touch_app),
                              Text('Select'),
                            ],
                          ), //Row
                        ), //Padding
                      ), //RaisedButton
                    ) //SizedBox
                  ],
                ), //Column
              ), //Padding
              //SizedBox
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green[500],
                      radius: 52,
                      child: CircleAvatar(
                        child: Icon(Icons.person, size: 45),
                        radius: 50,
                      ), //CircleAvatar
                    ), //CirclAvatar
                    SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'Search Picture on The basis of face',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green[900],
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text

                    //SizedBox
                    SizedBox(
                      width: 110,
                      child: RaisedButton(
                        onPressed: () => null,
                        color: Colors.green,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Icon(Icons.touch_app),
                              Text('Select'),
                            ],
                          ), //Row
                        ), //Padding
                      ), //RaisedButton
                    ) //SizedBox
                  ],
                ), //Column
              ), //Padding
              //SizedBox
            ),
          ),
        ),
      ],
    );
  }
}
