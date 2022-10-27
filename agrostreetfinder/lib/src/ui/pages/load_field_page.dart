import 'package:agrostreetfinder/src/models/type_production_agricola_model.dart';
import 'package:agrostreetfinder/src/models/type_production_agropecuaria_model.dart';
import 'package:agrostreetfinder/src/models/type_production_pecuario_model.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../models/type_production_model.dart';
import '../pagecontrollers/load_field_page_controllers.dart';
import 'home_page.dart';

class LoadFieldPage extends StatefulWidget{
  const LoadFieldPage({Key ? key}) : super(key:key);

  @override
  _LoadFieldPageState createState() => _LoadFieldPageState();
}

class _LoadFieldPageState extends StateMVC<LoadFieldPage> {
  final _formKey = GlobalKey<FormState>();
  final LoadFieldPageController _con = LoadFieldPageController.con;
@override
void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
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
              Row(
                children: [
                  Expanded(child: _dropDownProduction(),),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                          labelText: 'Hectareas'
                      ),
                    ),
                  ),
                ],
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


Widget _dropDownProduction(){
  List<TypeProductionModel> production = [TypeProductionAgropecuaria('Agropecuaria'), TypeProductionPecuario('Pecuario'), TypeProductionAgricola('Agricola')];
  TypeProductionModel selectItem = production.first;
  void setState(VoidCallback fn){}

  return Container(
    height: 60,
    decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(6)),
    child: Center(
      child: DropdownButton<TypeProductionModel>(
        value: selectItem,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        items: production
            .map<DropdownMenuItem<TypeProductionModel>>((TypeProductionModel value) {
          return DropdownMenuItem<TypeProductionModel>(
            value: value,
            child:  Text(value.name),
          );
        }).toList(),
        onChanged: (TypeProductionModel? newValue) {
          setState(() {
            selectItem = newValue!;
          });
        },
      ),
    ),
  );

}
