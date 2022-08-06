import 'package:agrostreetfinder/src/ui/screens/tabs_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

//Trabaja con latitud y longitud
  final _initialCameraPosition = const CameraPosition(
    target: LatLng(-25.4401187, -63.8570852),
    zoom: 15,
  );

  // final point = PointModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        bottom: const TabBar(
          tabs:
          <Widget>[
        Tab(
        icon: Icon(Icons.cloud_outlined),
      ),
      Tab(
        icon: Icon(Icons.beach_access_sharp),
      ),
      Tab(
        icon: Icon(Icons.brightness_5_sharp),
      ),
      ],
        ),
        centerTitle: true,
        title: const Text('Home'),
        leading: IconButton(
          onPressed: _openDrawer,
          iconSize: 30,
          icon: const Icon(Icons.list),),
      ),
      //El widget de Maps solo debe ir dentro de widget con las dimensiones definidas
      // Puede ir dentro de un container, sizeBox o directamente Body de scaffold.
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        mapType: MapType.hybrid,
        // markers: point.markers.toSet(),
        //Funcion que devuelve donde se hace toques en el mapa

        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      drawer: Drawer(
        child: AppBar(
            centerTitle: true,
            title: const Text('Menu'),
            leading: IconButton(
                onPressed: _closeDrawer,
                iconSize: 30,
                icon: const Icon(Icons.arrow_back_rounded))
        ),
      ),
    );
  }
}

