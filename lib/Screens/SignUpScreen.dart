import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:picky/api/api_base_helper.dart';

BaseHelper _helper = BaseHelper();

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    String email;
  String password;
  String username;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        BackButtonWidget(),
        Padding(
            padding: const EdgeInsets.all(20),
            key: _formKey,
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: () {}),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 4, right: 20),
                        child: TextField(
                          decoration: InputDecoration(hintText: 'Username'),
                        )))
              ],
            )),
        SizedBox(
          height: 20,
        ),
                Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: () {}),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 4, right: 20),
                        child: TextField(
                          onChanged: (username) {
                            this.username = username;
                          },
                          decoration: InputDecoration(hintText: 'Username'),
                        )))
              ],
            )),
        SizedBox(
                height: 20,
              ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.email), onPressed: () {}),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 4, right: 20),
                        child: TextField(
                          onChanged: (email) {
                            this.email = email;
                          },
                          decoration: InputDecoration(hintText: 'Email'),
                        )))
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: () {}),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 4, right: 20),
                        child: TextField(
                          onChanged: (password) {
                            this.password = password;
                          },
                          decoration: InputDecoration(hintText: 'Password'),
                        )))
              ],
            )),
        SizedBox(
                height: 20,
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( 
            children: <Widget>[  
              Radio(value: null, groupValue: null, onChanged: null),
              RichText(text: TextSpan(  
                text: 'I accept the ',
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Terms And Conditions',
                    style: TextStyle(color: Color(0xFF4A148C),
                    fontWeight: FontWeight.bold
                    ),
                  )
                ]
              ))
            ],
          ),
        ),
                SizedBox(
          height: 30,
        ),
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
        height: 60,
        child: RaisedButton(
          onPressed: () {signup(this.email, this.username,this.password);},
          color: Color(0xFF4A148C),
          child: Text('SIGN UP',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        )),
            ),
          ),
      ]),
    );
  }
    Future<void> signup(String email,String username, String password) async {
    try {
      final response = await http.post( 'http://localhost:3000/users/sign_up',
          headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, 
           body:jsonEncode(
           {'email': email, 
           'password': password,
           'username':username
           }));
          switch (response.statusCode) {
            case 200:
             Navigator.pushNamed(context, 'Home');
              
              break;
            default:
            SnackBar(content: Text('Welcome! you are registered!'));
          }
     
    } catch (e) {
      print(e);
    }
    }
 
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/img/lighterDark.png'))),
        child: Stack(children: <Widget>[
          Positioned(
            child: Stack(children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text('Back',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ]),
          ),

          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Create New Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ),
          ),
         
        ]));
  }
}
