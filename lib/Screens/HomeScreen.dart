import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(  
        height: double.infinity ,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('asset/img/homePage.png'))
        ),

      ),
    );
  }
}