import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:picky/api/api_base_helper.dart';

BaseHelper _helper = BaseHelper();

class CallWidget extends StatefulWidget {
  @override
  _CallWidgetState createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {
  String pnumber;

  final _formKey = GlobalKey<FormState>();
  TextEditingController call;
  @override
  void initState() {
    call = new TextEditingController();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'CallRider',
        ),
      ),
      body: Column(key: _formKey, children: <Widget>[
        TextField(controller: call),
        RaisedButton(
          color: Colors.purple,
          child: Text('Call'),
          onPressed: () {
            call2();
          },
        )
      ]),
    );
  }

  call2() {
    String phoneno = 'tel:' + call.text;
    launch(phoneno);
  }
}
