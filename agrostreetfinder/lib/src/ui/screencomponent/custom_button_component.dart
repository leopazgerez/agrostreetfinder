import 'package:flutter/material.dart';

class CustomButtonLabel extends StatelessWidget{
  final String label;

  onTap(){

  }
  const CustomButtonLabel ({Key ? key, required this.label}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
            color: Colors.black,
            width: 2.5),
        borderRadius: BorderRadius.circular(10)
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
          style:
          const TextStyle(
              fontSize: 25),
          ),
        ],
      ),
    );
  }
}