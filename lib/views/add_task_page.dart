import 'package:flutter/material.dart';

class AddTaskPage extends StatelessWidget{
  const AddTaskPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task', 
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      body: Column(
        children:[

          const ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tuesday, 9th', style: TextStyle(
                  color: Color.fromARGB(255, 69, 188, 235),
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),),

                Text('4 task', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),),
              ],
            ),

            subtitle: Text('February', style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 124, 122, 122)
            ),),
          ),

          ListTile(
            leading: Checkbox(value: true, onChanged: (value){}, activeColor: const Color.fromARGB(255, 233, 115, 140),),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Moring Run', style: TextStyle(decoration: TextDecoration.lineThrough),),
                Text('6:00 AM')
              ],
            ),
            
          ),

          ListTile(
            leading: Checkbox(value: true, onChanged: (value){}, activeColor: const Color.fromARGB(255, 233, 115, 140),),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Office', style: TextStyle(decoration: TextDecoration.lineThrough),),
                Text('10:00 AM')
              ],
            ),
            
          ),

          ListTile(
            leading: Checkbox(value: false, onChanged: (value){}, activeColor: const Color.fromARGB(255, 233, 115, 140),),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Meeting'),
                Text('12:00 PM')
              ],
            ),
            
          ),

          ListTile(
            leading: Checkbox(value: false, onChanged: (value){}, activeColor: const Color.fromARGB(255, 233, 115, 140),),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Lunch'),
                Text('03:00 PM')
              ],
            ),
            
          ),
        ],
      ),
    );
  }
}

/*class Persona{
  String nombre;
  String? apellido;
  int? edad;
  Persona(this.nombre,{this.apellido, this.edad});
}

final brian = Persona('brian', apellido: 'Notrabaja', edad: 58);

class Servivo{
  Persona humano;

  Servivo({required this.humano});
}

final homosapien = Servivo(humano: brian); */