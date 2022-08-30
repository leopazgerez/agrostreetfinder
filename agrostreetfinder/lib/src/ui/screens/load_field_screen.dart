import 'package:agrostreetfinder/src/models/type_production_agricola_model.dart';
import 'package:agrostreetfinder/src/models/type_production_agropecuaria_model.dart';
import 'package:agrostreetfinder/src/models/type_production_pecuario_model.dart';
import 'package:agrostreetfinder/src/ui/screens/map_screen.dart';
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
                  labelText: 'Cultivo'
                ),
              ),const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                    labelText: 'Hectareas'
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


Widget _dropDownProduction(){
  List<TypeProductionModel> items = [TypeProductionAgropecuaria('Agropecuaria'), TypeProductionPecuario('Pecuario'), TypeProductionAgricola('Agricola')];
  TypeProductionModel selectItem = items.first;
  void setState(VoidCallback fn) {
  }

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