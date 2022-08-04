import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/point_model.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
//Trabaja con latitud y longitud
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(-25.4401187, -63.8570852),
    zoom: 15,
  );
  // final point = PointModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      //El widget de Maps solo debe ir dentro de widget con las dimensiones definidas
      //Puede ir dentro de un container, sizeBox o directamente Body de scaffold.
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.hybrid,
        // markers: point.markers.toSet(),
        //Funcion que devuelve donde se hace toques en el mapa

        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}