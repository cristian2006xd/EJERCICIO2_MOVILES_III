import 'package:app_12/main.dart';
import 'package:flutter/material.dart';

class Leerscreen extends StatelessWidget {
  const Leerscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: lista());
  }
}

Future<List<dynamic>> leerSupa() async {
  final data = await supabase.from('autos').select();
  return data;
}

/////////////////////////////////////////////////

class lista extends StatefulWidget {
  const lista({super.key});

  @override
  State<lista> createState() => _listaState();
}

class _listaState extends State<lista> {
  List data = [];

  Future<void> cargarDatos() async {
    final fetchData = await leerSupa();

    setState(() {
      data = fetchData;
    });
  }

  void initState() {
    super.initState();
    cargarDatos();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: leerSupa(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.hasData) {
          final data = snapshot.data!;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final auto = data[index];

              return ListTile(
                title: Text(auto['placa']),
                trailing: IconButton(
                  onPressed: () => eliminar(auto['placa'], index),
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        } else {
          return Text("No hay datos");
        }
      },
    );
  }

  Future<void> eliminar(placa, index) async {
    await supabase.from('autos').delete().eq('placa', placa);

    setState(() {
      data.removeAt(index);
    });
  }
}

////////////////////////////////////////////////
 


 
