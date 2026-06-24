import 'package:app_12/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( child: Container(
        width: 300,
        child: formulario( context ))),
    );
  }
}

Widget formulario( context ){
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

    FilledButton.icon(
      onPressed: () => login(context, correo, contrasenia), 
      label: Text("Login"), 
      icon: Icon(Icons.login_outlined),)
  ],);
}

Future<void> login( context, correo, contrasenia ) async {
  final AuthResponse res = await supabase.auth.signUp(
  email: correo.text,
  password: contrasenia.text,
);
final Session? session = res.session;
final User? user = res.user;

Navigator.pushNamed(context, "/guardar");
}