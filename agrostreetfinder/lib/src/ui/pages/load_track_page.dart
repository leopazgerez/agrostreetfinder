import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../pagecontrollers/load_track_page_controllers.dart';
import 'home_page.dart';

class LoadTrackPage extends StatefulWidget{
  const LoadTrackPage({Key ? key}) : super(key:key);

  @override
  _LoadTrackPageState createState() => _LoadTrackPageState();
}

class _LoadTrackPageState extends StateMVC<LoadTrackPage> {
  final LoadTrackPageController _con = LoadTrackPageController.con;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ThemeData.from(colorScheme: colorScheme),
        centerTitle: true,
        title: const Text('Camino'),
        ),
      body: _body(context, _formKey),
      );
  }
  }

Widget _body(context, formKey){
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
                    MaterialPageRoute(builder: (context) => const HomePage()),
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


