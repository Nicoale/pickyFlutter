import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container( 
            height: 300,
            decoration: BoxDecoration(  
              image: DecorationImage(image: AssetImage('assets/img/lighterDark.png'), fit: BoxFit.cover)
            )
          ),
          SizedBox(
            height:20,
          ),
          Padding ( 
            padding : const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[  
                IconButton(icon: Icon(Icons.person), onPressed: (){}),
                Expanded(child:
                Container(  
                  margin: EdgeInsets.only(left: 4, right: 20),
                  child: TextField(  
                    decoration: InputDecoration(   
                      hintText: 'Username'
                    ),
                  )))
            ],
            )
          ),
                   Padding ( 
            padding : const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[  
                IconButton(icon: Icon(Icons.lock), onPressed: (){}),
                Expanded(child:
                Container(  
                  margin: EdgeInsets.only(left: 4, right: 20),
                  child: TextField(  
                    decoration: InputDecoration(   
                      hintText: 'Password'
                    ),
                  )))
            ],
            )
          )
        ]
      ),
    );
  }
}