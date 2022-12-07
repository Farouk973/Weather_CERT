import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_irrigation/ui/weatherstationpage.dart';
import 'Navbar.dart';
import 'nextpage.dart';

class mapPage extends StatefulWidget {
  @override
  _mapPAge createState() => _mapPAge();
}

class _mapPAge extends State<mapPage> {
  late GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  static const LatLng _morneg = const LatLng(36.681993, 10.289079);
  static const LatLng _Zaghwan = const LatLng(36.406093, 10.136593);
  static const LatLng _kelibia = const LatLng(36.843406, 11.107647);
  int _test = 0;
  var duration = const Duration(milliseconds: 500);
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('search for station');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: customSearchBar,
              automaticallyImplyLeading: true,
              leading: GestureDetector(
                child: Icon(
                  Icons.arrow_back_sharp,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Weatherapp3Widget())),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = const Icon(Icons.cancel);
                        customSearchBar = const ListTile(
                          leading: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                          title: TextField(
                            decoration: InputDecoration(
                              hintText: 'write the station',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      } else {
                        customIcon = const Icon(Icons.search);
                        customSearchBar = const Text('search for station');
                      }
                    });
                  },
                  icon: customIcon,
                )
              ],
              centerTitle: true,
            ),
            drawer: Navbar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _morneg,
                      zoom: 8.0,
                    ),
                    markers: this.myMarker(),
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        myMapController = controller;
                      });
                    },
                  ),
                ),
              ],
            )));
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_morneg.toString()),
        position: _morneg,
        infoWindow: InfoWindow(
            title: 'Morneg',
            snippet: 'Bassin Morneg',
            onTap: () {
              _test = 1;
            }),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId(_Zaghwan.toString()),
        position: _Zaghwan,
        infoWindow: InfoWindow(
            title: 'Zaghwen',
            snippet: 'Bassin Zaghwen',
            onTap: () {
              _test = 2;
            }),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _markers.add(Marker(
        markerId: MarkerId(_kelibia.toString()),
        position: _kelibia,
        infoWindow: InfoWindow(
            title: 'kelibia',
            snippet: 'Bassin kelibia',
            onTap: () {
              _test = 3;
            }),
        icon: BitmapDescriptor.defaultMarker,
      ));
      if (_test == 1) {
        sleep(duration);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => page1()));
      }
    });

    return _markers;
  }
}
