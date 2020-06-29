import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

GoogleMapController myController;

class _CurrentLocationState extends State<CurrentLocation> {
  static LatLng _customerPosition;

  @override
  void initState() {
    super.initState();
  
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
  }
    _onCameraMove(CameraPosition position) {
    _customerPosition = position.target;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Location')),
      body: Column(children: <Widget>[
        Container(
          height: 400,
          width: double.infinity,
          child: GoogleMap(
            onMapCreated: (controller) {
              setState(() {
                myController = controller;
              });
            },
            initialCameraPosition: CameraPosition(target: _customerPosition,
            zoom: 14.4746 ),
                        zoomGesturesEnabled: true,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {
        getCurrentLocation();
        Icon(
          
        Icons.add_location, 
        color: Colors.purple);
      }),
    );
  }
}
