import 'package:flutter/material.dart';

class LoadTrackScreen extends StatefulWidget{
  const LoadTrackScreen({Key ? key}) : super(key:key);

  @override
  State<LoadTrackScreen> createState() => _LoadTrackScreenState();
  }
  class _LoadTrackScreenState extends State<LoadTrackScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ThemeData.from(colorScheme: colorScheme),
        centerTitle: true,
        title: const Text('Nuevo'),
      ),
      body: body(),
      );
  }
  }



  Widget body(){
  return TextFormField(
    decoration: const InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'Name',
    )
         // onEditingComplete: '',
  );
  }