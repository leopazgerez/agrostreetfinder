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
    final formKey = GlobalKey<FormState>();
    final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
    return SingleChildScrollView(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (value){
                    if (value == null || value.isEmpty){
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
              ),Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    enabledBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    labelText: 'Descripcion',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, left: 20),
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: (){},
                        child: const Icon(
                          Icons.cancel,
                          size: 45,)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: 320,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: (){
                          if (formKey.currentState!.validate()) {
                            //En caso de no tener un BuildContext creo una variable
                            //de tipo GlobalKey y le asigno GlobalKey<ScaffoldMessengerState>()
                            scaffoldKey.currentState!.showSnackBar(
                                const SnackBar(content: Text('Guardado'))
                            );
                          }
                        },
                        child: const Icon(
                          Icons.save,
                          size: 45,)
                    ),
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
