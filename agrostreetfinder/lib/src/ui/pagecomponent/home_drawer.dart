
import 'package:flutter/material.dart';

class List extends StatefulWidget{
    const List ({Key? key}) : super(key: key);

   // final List items = [];
  //
  // get length => items.length;

   void setItems(items){
     items.add(items);
   }

  @override
  State<List> createState() => _List();
}

class _List extends State<List>{
// @override
  // void setState() {
  //
  //   super.setState();
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Lista'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemBuilder: (context, index){
        // final item = items[index];
        return const ListTile(
          title: Text('Something'),
        );
      },
      ),
    );
  }
}