import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';
 
import 'package:picky/api/api_base_helper.dart';
 
BaseHelper _helper = BaseHelper();

class CurrentLocation extends StatefulWidget {
 String location;
 
 @override
 _CurrentLocationState createState() => _CurrentLocationState();
}
 
GoogleMapController myController;
 
class _CurrentLocationState extends State<CurrentLocation> {
 static LatLng _customerPosition = const LatLng(45.521563, -122.677433);
 
 @override
 void initState() {
   super.initState();
 }
 
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Location')),
     body: Column(children: <Widget>[
       Container(
         height: MediaQuery.of(context).size.height * 0.85,
         width: double.infinity,
         child: GoogleMap(
           onMapCreated: (controller) {
             setState(() {
               myController = controller;
             });
           },
           initialCameraPosition:
               CameraPosition(target: _customerPosition, zoom: 14.4746),
           zoomGesturesEnabled: true,
           onCameraMove: _onCameraMove,
           myLocationEnabled: true,
           compassEnabled: true,
         ),
             )
     ]),
     floatingActionButton: FloatingActionButton(onPressed: () {
       getCurrentLocation();
       Icon(Icons.add_location, color: Colors.purple);
     }),
   );
 }
 
 void getCurrentLocation() async {
   Position position = await Geolocator()
       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
   List<Placemark> placemark = await Geolocator()
       .placemarkFromCoordinates(position.latitude, position.longitude);
   setState(() {
     _customerPosition = LatLng(position.latitude, position.longitude);
     print('${placemark[0].name}');
   });
   Navigator.pushNamed(context, 'Call');
 }
 
 _onCameraMove(CameraPosition position) {
   _customerPosition = position.target;
 }
 
 Future<void> signin(String location) async {
   try {
     final response =
         await _helper.post('user', jsonEncode({'location': location}));
     switch (response.statusCode) {
       case 200:
         Navigator.pushNamed(context, 'Home');
 
         break;
       default:
         SnackBar(content: Text('Call'));
     }
        } catch (e) {
     print(e);
   }
 }
}









