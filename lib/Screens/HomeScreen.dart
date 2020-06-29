import 'package:flutter/material.dart';
import 'package:picky/api/api_base_helper.dart';
import 'dart:convert';
 
BaseHelper _helper = BaseHelper();
 
class Homescreen extends StatefulWidget {
 @override
 _HomescreenState createState() => _HomescreenState();
}
 
class _HomescreenState extends State<Homescreen> {
 String rider;
 String gas;
 
 final _formKey = GlobalKey<FormState>();
 
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(children: <Widget>[
       Container(
           height: 500,
           decoration: BoxDecoration(
               image: DecorationImage(
                   fit: BoxFit.fill,
                   image: AssetImage('assets/img/homepage.png')))),
       SizedBox(
         height: 20,
       ),
       Padding(
         padding: const EdgeInsets.all(20.0),
         key: _formKey,
         child: ClipRRect(
           borderRadius: BorderRadius.circular(5),
           child: Container(
               height: 60,
               child: RaisedButton(
                 onPressed: () {
                   this.rider = rider;
                 },
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
                 onPressed: () {
                   this.gas = gas;
                   Navigator.pushNamed(context, 'Location');
                 },
                 // {Navigator.pushNamed(context, 'Location');},
                 color: Color(0xFF4A148C),
                 child: Text('I need Gas',
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
 
 Future<void> signin(String rider, String gas) async {
   try {
     final response =
         await _helper.post('user', jsonEncode({'rider': rider, 'gas': gas}));
     switch (response.statusCode) {
       case 200:
         Navigator.pushNamed(context, 'Location');
 
         break;
       default:
         SnackBar(content: Text(''));
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
       child: Stack(children: <Widget>[
     Positioned(
       bottom: 500,
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
             style:
                 TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
       ]),
     ),
   ]));
 }
}
