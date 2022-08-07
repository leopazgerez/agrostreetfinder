import 'package:agrostreetfinder/src/ui/screens/load_track_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const TestingScreens());
}
class TestingScreens extends StatelessWidget{
  const TestingScreens ({Key ? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testing Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoadTrackScreen(),
    );
  }
}