import 'package:flutter/material.dart';

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
  return Container(
    padding: const EdgeInsets.symmetric(),
    child: SingleChildScrollView(
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
                  labelText: 'Nombre',
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
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Hectareas' ,
                  ),
                ),
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
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Tipo de Produccion' ,
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
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Cultivo' ,
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
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Tipo de Rodeo' ,
              ),
            )
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //pasar icon button a elevated u otro que note mejor que es una Botón.
            ElevatedButton(
                onPressed: (){},
                  child: const Icon(Icons.cancel),
            ),
            const SizedBox(
              width: 150,
            ),
            ElevatedButton(
                onPressed: (){},
                child: const Icon(Icons.save),
            ),
          ],
        ),
      ],
    ),
    ),
  );
}

// int id;

// double? Hectareas;
// String? typeProduction;
// String? crop;
// String? typeRodeo;