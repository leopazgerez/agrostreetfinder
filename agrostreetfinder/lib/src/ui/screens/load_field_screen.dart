import 'package:agrostreetfinder/src/models/type_production_agricola_model.dart';
import 'package:agrostreetfinder/src/models/type_production_agropecuaria_model.dart';
import 'package:agrostreetfinder/src/models/type_production_pecuario_model.dart';
import 'package:flutter/material.dart';

import '../../models/type_production_model.dart';

class LoadFieldScreen extends StatefulWidget{
  const LoadFieldScreen({Key ? key}) : super(key:key);

  @override
  State<LoadFieldScreen> createState() => _LoadFieldScreenState();
}
class _LoadFieldScreenState extends State<LoadFieldScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ThemeData.from(colorScheme: colorScheme),
        centerTitle: true,
        title: const Text('Campo'),
      ),
      body: body(),
    );
  }
}


Widget body() {
  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final formKey = GlobalKey<FormState>();
  final navigatorKey = GlobalKey<NavigatorState>();

  return SingleChildScrollView(
    child: Form(
      key: formKey,
      // autovalidateMode: ,
      //escribir la separacion de cada widget con un sizebox y
      // el paddin para separar los espacios con el padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
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
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                labelText: 'Hectáreas',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                labelText: 'Cultivo',
              ),
            ),
          ),
          dropDownProduction(),
          /*Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                labelText: 'Tipo de Producción',
              ),
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(),
                labelText: 'Tipo de Rodeo',
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
                // width: screenSize.width/2.5,
                width: 320,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, );
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: 45,)),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                // width: screenSize.width/2.5,
                width: 320,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
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

Widget dropDownProduction(){
  List<TypeProductionModel> items = [TypeProductionAgropecuaria('Agropecuaria'), TypeProductionPecuario('Pecuario'), TypeProductionAgricola('Agricola')];
  TypeProductionModel selectItem = items.first;
  void setState(Null Function() param0){};

  return DropdownButton<TypeProductionModel>(
    value: selectItem,
    icon: const Icon(Icons.arrow_downward),
    elevation: 16,
    style: const TextStyle(color: Colors.deepPurple),
    underline: Container(
      height: 2,
      color: Colors.deepPurpleAccent,
    ),
    onChanged: (TypeProductionModel? newValue) {
      setState(() {
        selectItem = newValue!;
      });
    },
    items: items
        .map<DropdownMenuItem<TypeProductionModel>>((TypeProductionModel value) {
      return DropdownMenuItem<TypeProductionModel>(
        value: value,
        child:  Text(value.name),
      );
    }).toList(),
  );
}






// int id;

// double? Hectareas;
// String? typeProduction;
// String? crop;
// String? typeRodeo;