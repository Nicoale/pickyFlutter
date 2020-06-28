import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}
GoogleMapController myController;
class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: Text('Location')
      ),
      body: Column(
        children: <Widget>[
          Container( 
            height:400,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: (controller){
                setState(() {
                  myController=controller;
                });
              }, initialCameraPosition: null,),
          ),
        ]
    ),
    floatingActionButton: FloatingActionButton( 
      
      onPressed:() {getCurrentLocation();}
            
            ),
          );
        }
      }
      
      void getCurrentLocation() {
}