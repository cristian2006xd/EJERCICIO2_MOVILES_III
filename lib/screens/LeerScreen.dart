import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Leerscreen extends StatelessWidget {
  const Leerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lista(),
    );
  }
}

Future<List<dynamic>> leerFire() async {
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('autos/').get();

  if (snapshot.exists) {
    print(snapshot.value);

    return snapshot.children.map((child) {
      final data = Map.from(child.value as Map);
      return {
        "placa": child.key,
        "marca": data['marca'],
        "precio": data['precio'],
      };
    }).toList();
  } else {
    return [];
  }
}

Widget lista() {
  return FutureBuilder(
      future: leerFire(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];

                return ListTile(
                  title: Text(item['placa']),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Detalle: ${item['placa']}"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.directions_car),
                                title: const Text("Marca"),
                                subtitle: Text(item['marca'] ?? 'Sin marca'),
                              ),
                              ListTile(
                                leading: const Icon(Icons.attach_money),
                                title: const Text("Precio"),
                                subtitle: Text(item['precio']?.toString() ?? 'N/A'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cerrar"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              });
        } else {
          return const Center(child: Text("NO HAY DATA"));
        }
      });
}