import 'package:flutter/material.dart';

import '../../models/lot_model.dart';

class ListScreenComponent extends StatefulWidget{
  final List items;
  const ListScreenComponent ({Key ?key, required this.items}) : super(key: key);

  @override
  State<ListScreenComponent> createState() => _ListScreenComponentState();
  }

  class _ListScreenComponentState extends State<ListScreenComponent> {

    @override
    Widget build(BuildContext context) {
      return ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
          return Text(widget.items[index].name);
          }
      );
    }
  }
  abstract class ListItems{

  Widget buildTitle(BuildContext context);

  Widget buildSubtitle(BuildContext context);
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