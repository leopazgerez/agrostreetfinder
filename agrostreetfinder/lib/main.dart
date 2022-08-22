import 'package:agrostreetfinder/src/ui/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


  class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MapScreen(),
    );
  }
}
