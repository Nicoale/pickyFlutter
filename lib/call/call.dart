import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallWidget extends StatefulWidget {
  @override
  _CallWidgetState createState() => _CallWidgetState();
}

class _CallWidgetState extends State<CallWidget> {
  TextEditingController call;
  @override
  void initState() {
    call= new TextEditingController();
    super.initState();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        title: Text('CallRider',
        ),
        ),
        body: Column(
          children:<Widget>[ 
            TextField(controller:call),
            RaisedButton(color: Colors.purple,
            child: Text('Call'),
            onPressed: (){call2();},
                        )
                      ]
                    ),
                );
              }
             call2() {
               String phoneno = 'tel:'+ call.text;
               launch(phoneno);
}
            }
            