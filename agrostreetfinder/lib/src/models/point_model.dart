import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointModel {
    PointModel();
  final Map<MarkerId, Marker> _markers = {};
  //metodos set para setear los marcadores y retornar los valores de los marcadores del mapa
  Set<Marker> get markers => _markers.values.toSet();
//metodo para colocar un marcador en el mapa
//para eso tengo que hacer una instancia de marker
  onTap(LatLng position) {
    //el constructor de marker necesita como parametro una variable de tipo MarkerId
    //el constructor de MarkerId pide por parametro un string, ese string es el valor unico para cada marcador
    //por lo tanto hago uso de los marcadores seteados y los convierto a tipo string
    final markerId = MarkerId(markers.length.toString());
    //La posicion es una propiedad de los marcadores que la obtiene de la lat y long.
    final marker = Marker(
      markerId: markerId,
      position: position,
    );
    //guardamos los marcadores en la lista vacia creada al incio
    _markers[markerId] = marker;
  }
}
