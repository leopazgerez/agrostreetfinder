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
        title: const Text('Camino'),
        ),
      body: body(),
      );
  }
  }


  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            padding:  const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              maxLength: 50,
              textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                labelText: 'Name',
                  ),
                )
            ),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              ),
              padding:  const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                maxLines: 3,
                maxLength: 100,
                decoration: const InputDecoration(
                  labelText: 'Description' ,
                ),
              )
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.cancel,
                    size: 35,)),
              const SizedBox(
                width: 150,
              ),
              IconButton(
                  onPressed: (){},
                  icon: const Icon(
                    Icons.save,
                    size: 35,)
              ),
              ],
          ),
        ],
      ),
    );
  }
