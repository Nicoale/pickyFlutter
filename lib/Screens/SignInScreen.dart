import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:picky/api/api_base_helper.dart';

BaseHelper _helper = BaseHelper();

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email;
  String password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
        Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/lighterDark.png'),
                    fit: BoxFit.cover))),
        SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            key: _formKey,
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.mail), onPressed: () {}),
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
          padding: const EdgeInsets.all(20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    signin(this.email, this.password);
                  },
                  color: Color(0xFF4A148C),
                  child: Text('SIGN IN',
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
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'SignUp');
          },
          child: Center(
            child: RichText(
              text: TextSpan(
                  text: 'Don\'t have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'SIGN UP ',
                        style: TextStyle(
                            color: Color(0xFF4A148C),
                            fontWeight: FontWeight.bold))
                  ]),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> signin(String email, String password) async {
    try {
      final response = await _helper.post(
          'user', jsonEncode({'email': email, 'password': password}));
          switch (response.statusCode) {
            case 200:
             Navigator.pushNamed(context, 'Home');
              
              break;
            default:
            SnackBar(content: Text('Yay! you are logged!'));
          }
    } catch (e) {
      print(e);
    }
  }
}
