import 'package:flutter/material.dart';
import 'package:handytest/widgets/create_visit.dart';

import '../widgets/app_header.dart';
import '../widgets/delete_visit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> options = [
    'Lista de visitas',
    'Crear visitas',
    'Borrar visitas'
  ];
  List<bool> selectedItems = [false, false, false];
  String logText = '\n- Log de ejecución';

  void runTests() {
    setState(() async {
      if (selectedItems[1]) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateVisit()),
        );
      } else if (selectedItems[2] == true) {
        logText = deleteVisit(logText).toString();
      } else {
        logText = 'No hay prueba seleccionada';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menú lateral
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Encabezado
                const AppHeader(),

                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 280,
                  height: 200,
                  child: ListView.builder(
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(
                          options[index],
                          style: const TextStyle(color: Colors.black),
                        ),
                        value: selectedItems[index],
                        onChanged: (newValue) {
                          setState(() {
                            selectedItems[index] = newValue!;
                          });
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black),
                        onPressed: runTests,
                        child: const Text('Correr prueba'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Container(
            width: 800,
            height: 700,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 200, 223, 242),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2.0,
                      blurRadius: 5.0)
                ]),
            child: Text(logText),
          )
        ],
      ),
    );
  }
}
