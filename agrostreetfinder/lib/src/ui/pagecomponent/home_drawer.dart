
import 'package:flutter/material.dart';

import '../../models/lot_model.dart';

class NavigationDrawer extends StatelessWidget {
  final VoidCallback? onPressed;
  final List<LotModel> lot;
  const  NavigationDrawer({Key? key, this.onPressed, required this.lot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.green,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppBar(
              centerTitle: true,
              title: const Text('Menu'),
              leading: IconButton(
                  onPressed: onPressed,
                  iconSize: 30,
                  icon: const Icon(Icons.arrow_back_rounded)),
            ),
            // buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(context) =>
      Container(
        // MediaQuery es una clase que hace que el widget se adapte a al tamano de la pantalla
        //hace que el widget sea responsivo. Esto significa que que el Widget se reconstruye
        //en base al  tamano de pantalla del dispositivo en el que cual se esta ejecutando la app
        padding: EdgeInsets.only(
          //en este metodo lo que esta haciendo es adaptar la parte de arriba del contenedor
          // en base a
            top: MediaQuery
                .of(context)
                .padding
                .top),
      );

  Widget buildMenuItems(context) =>
      SizedBox(
          height: double.maxFinite,
          width: 50,
          child: ListView.builder(
              itemCount: lot.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black)),
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.circle),
                      trailing: const Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text('Lote ${lot[index].name}'),
                      subtitle: Text('Cultivo ${lot[index].crop}'),
                  ),
                );
              },
          )
      );
}