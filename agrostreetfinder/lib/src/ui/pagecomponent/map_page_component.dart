import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapPageComponent extends StatefulWidget {
  const MapPageComponent({Key? key}) : super(key: key);

  @override
  State<MapPageComponent> createState() => _MapPageComponentState();
}

class _MapPageComponentState extends State<MapPageComponent> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(19.0759837, 72.8776559),
    zoom: 14.4746,
  );
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  List<LatLng> latLen = [
    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // declared for loop for various locations
    for(int i=0; i<latLen.length; i++){
      _markers.add(
        // added markers
          Marker(
            markerId: MarkerId(i.toString()),
            position: latLen[i],
            infoWindow: InfoWindow(
              title: 'HOTEL',
              snippet: '5 Star Hotel',
            ),
            icon: BitmapDescriptor.defaultMarker,
          )
      );
      setState(() {

      });
      _polyline.add(
          Polyline(
            polylineId: PolylineId('1'),
            points: latLen,
            color: Colors.green,
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: _markers,
      // polylines: _polyline,
      mapType: MapType.hybrid,
      zoomControlsEnabled: false,
        initialCameraPosition: _kGooglePlex);
  }
}
