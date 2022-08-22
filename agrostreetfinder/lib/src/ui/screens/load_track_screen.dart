import 'package:flutter/material.dart';

import 'map_screen.dart';

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
      body: _body(context),
      );
  }
  }

Widget _body(context){
  final formKey = GlobalKey<FormState>();
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: _form(context, formKey),
        ),
      ),
      _buttons(context, formKey)
    ],
  );
}


Widget _form(context, formKey) {
  return Column(
    children: [
      Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo es requerido';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: 'Descripcion'
                ),
              ),const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )
    ],
  );
}


Widget _buttons(context, formKey){

  Color color = Colors.green;
  Color colorIcon = Colors.white;
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
      children: [
        Expanded(
          child:
          Container(
            color: color,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapScreen()),
                  );
                },
                child: Icon(Icons.cancel,
                  size: 45,
                  color: colorIcon,)
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            color: color,
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Guardado'))
                    );
                  }
                },
                child: Icon(Icons.save,
                  size: 45,
                  color: colorIcon,)
            ),
          ),
        ),
      ],
    ),
  );
}


