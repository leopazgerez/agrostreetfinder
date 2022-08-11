import 'package:agrostreetfinder/src/models/lot_model.dart';
import 'package:agrostreetfinder/src/models/street_model.dart';
import 'package:agrostreetfinder/src/ui/screencontrollers/expandable_fab_screen_controller.dart';
import 'package:agrostreetfinder/src/ui/screens/load_field_screen.dart';
import 'package:agrostreetfinder/src/ui/screens/load_track_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../screencomponent/action_button_screen_component.dart';

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
         indicatorColor: Color(0xFFC8E6C9),
        tabs: ( <Widget>
        [
            Tab(
                icon: Icon(Icons.place_outlined)
            ),
          Tab(
            icon: Icon(Icons.route_outlined),
          ),
          Tab(
            icon: Icon(Icons.star_border),
          ),
          ]
        ),
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
        zoomControlsEnabled: false,
      ),
      floatingActionButton: ExpandableFab(
      distance: 80.0,
      children:[
        ActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoadTrackScreen()),
            );
          },
          icon: const Icon(Icons.route_outlined,
            color: Colors.white,
          ),
        ),
        ActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoadFieldScreen()),
            );
          },
          icon: const Icon(Icons.place_outlined,
          color: Colors.white,),
        ),
      ],
    ),
      drawer: Drawer(
        child: AppBar(
                centerTitle: true,
                title: const Text('Menu'),
                leading: IconButton(
                    onPressed: _closeDrawer,
                    iconSize: 30,
                    icon: const Icon(Icons.arrow_back_rounded)
                ),
          actions: [
          ListBody(
            children: [
              listLots()
            ],
          )
          ],
            ),
        ),
   );
  }
}






Widget listLots(){
List<LotModel> lots = [
  LotModel(id: 1, name: 'A1'),
  LotModel(id: 2, name: 'A2'),
  LotModel(id: 3, name: 'A3')
];
  return ListView.builder(
    // itemCount: lots.length,
      itemBuilder: (context, index){
        return Text(lots[index].name);
      }
      );
}



Widget listStreet(){
  List<StreetModel> streets = [
    StreetModel(name: 'Calle 1'),
    StreetModel(name: 'Calle 2'),
    StreetModel(name: 'Calle 3'),
    StreetModel(name: 'Calle 4'),
  ];
  return ListView.builder(
    // itemCount: streets.length,
      itemBuilder: (context, index){
      return Text(streets[index].name);
      }
      );
}