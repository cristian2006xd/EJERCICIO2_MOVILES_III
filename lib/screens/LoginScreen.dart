import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( child: Container(
        width: 300,
        child: formulario())),
    );
  }
}

Widget formulario(){
  TextEditingController correo = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  return Column( 
    mainAxisSize: MainAxisSize.min,
    children: [
    TextField(
      controller: correo,
    ),
    
    TextField(
      controller: contrasenia,
    ),

    FilledButton.icon(onPressed: () => (), label: Text("Login"), icon: Icon(Icons.login_outlined),)
  ],);
}