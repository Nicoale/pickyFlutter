import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: ListView(children: <Widget>[
        Container( 
          height: double.infinity ,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/img/homepage.png'))
          )),
      SizedBox(
          height: 20,
        ),
      Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF4A148C),
                  child: Text('I am a Rider',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
          ),
        ),
 SizedBox(
          height: 20,
        ),
     Padding(
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF4A148C),
                  child: Text('I need Gas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
          ),
        ),
        ]
      ),
    );
  }
}