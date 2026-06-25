import 'package:app_12/main.dart';
import 'package:flutter/material.dart';
 
class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: formulario());
  }
}
 
/////////////////////////////////////////////////////////////
 
class formulario extends StatefulWidget {
  const formulario({super.key});
 
  @override
  State<formulario> createState() => _formularioState();
}
 
class _formularioState extends State<formulario> {
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();
 
  bool ver = false;
 
  void cambiarVer() {
    setState(() {
      ver = !ver;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return (Center(
      child: Container(
        width: 350,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: placa),
            TextField(controller: marca),
            TextField(
              controller: precio,
              obscureText: ver,
              decoration: InputDecoration(
                prefix: Icon(Icons.price_change),
                suffix: IconButton(
                  onPressed: () => cambiarVer(),
                  icon: ver
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                ),
              ),
            ),
 
            ElevatedButton(
              onPressed: () => guardar(placa, marca, precio),
              child: Text("Guardar"),
            ),
 
            OutlinedButton(
              onPressed: () => Navigator.pushNamed(context, "/leer"),
              child: Text("Leer"),
            ),
          ],
        ),
      ),
    ));
  }
}
 
/////////////////////////////////////////////////////////////
 
Future<void> guardar(placa, marca, precio) async {
  await supabase.from('autos').insert({
    'placa': placa.text,
    'marca': marca.text,
    'precio': double.parse(precio.text),
  });
}