import 'package:flutter/material.dart';

class Guardarscreen extends StatelessWidget {
  const Guardarscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: formulario(),
    );
  }
}

Widget formulario(){
  TextEditingController placa = TextEditingController();
  TextEditingController marca = TextEditingController();
  TextEditingController precio = TextEditingController();

  return (
    Container(
      width: 350,
      child: Center(
        child: Column(
          children: [
            TextField(
              controller: placa,
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            TextField(
              controller: marca,
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              controller: precio,
              decoration: InputDecoration(
                hintText: 'Nick',
              ),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    )
  );
}

