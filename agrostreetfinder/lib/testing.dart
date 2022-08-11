import 'package:agrostreetfinder/src/models/lot_model.dart';
import 'package:agrostreetfinder/src/ui/screencomponent/list_screen_component.dart';
import 'package:agrostreetfinder/src/ui/screens/load_field_screen.dart';
import 'package:agrostreetfinder/src/ui/screens/load_track_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const TestingScreens());
}
class TestingScreens extends StatelessWidget{
  const TestingScreens ({Key ? key}) : super(key:key);

  @override
  Widget build(BuildContext context)  {
    List<LotModel> lots = [
      LotModel(id: 1, name: 'A1'),
      LotModel(id: 2, name: 'A2'),
      LotModel(id: 3, name: 'A3')
    ];
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('list'),
          centerTitle: true,
        ),
        body: ListScreenComponent(items: [lots],),
      ),

    );
  }
}