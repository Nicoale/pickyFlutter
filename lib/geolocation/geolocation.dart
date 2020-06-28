import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

enum _TabItem {
  singleLocation,
  distance,
  geocode
}

class _MyLocation extends StatefulWidget {
  @override
  __MyLocationState createState() => __MyLocationState();
}

class __MyLocationState extends State<_MyLocation> {
  _TabItem _currentItem = _TabItem.singleLocation;
  final List<_TabItem>_bottomTabs = [
    _TabItem.singleLocation,
     _TabItem.distance,
    
  ];
   


  @override
  void initState() {

    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Location'),
        ),
      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    switch (_currentItem) {
      case _TabItem.distance:
        return CalculateDistanceWidget();
      case _TabItem.geocode:
        return LookupAddressWidget();
      case _TabItem.singleLocation:
      default:
        return CurrentLocationWidget(androidFusedLocation: false);
    }
  }
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _bottomTabs
          .map((tabItem) =>
              _buildBottomNavigationBarItem(_icon(tabItem), tabItem))
          .toList(),
      onTap: _onSelectTab,
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, _TabItem tabItem) {
    final String text = _title(tabItem);
    final Color color =
        _currentItem == tabItem ? Theme.of(context).primaryColor : Colors.grey;

    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: color,
        ),
      ),
    );
  }


  void _onSelectTab(int index) {
    _TabItem selectedTabItem = _bottomTabs[index];

    setState(() {
      _currentItem = selectedTabItem;
    });
  }
    String _title(_TabItem item) {
    switch (item) {
      case _TabItem.singleLocation:
        return 'Single';
      case _TabItem.distance:
        return 'Distance';
      case _TabItem.geocode:
        return 'Geocode';
      default:
        throw 'Unknown: $item';
    }
  }

  IconData _icon(_TabItem item) {
    switch (item) {
      case _TabItem.singleLocation:
        return Icons.location_on;
      case _TabItem.distance:
        return Icons.redo;
      case _TabItem.geocode:
        return Icons.compare_arrows;
      default:
        throw 'Unknown: $item';
    }
  }

}