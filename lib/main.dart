import 'package:app_12/screens/DetallesScreen.dart';
import 'package:app_12/screens/GuardarScreen.dart';
import 'package:app_12/screens/LeerScreen.dart';
import 'package:app_12/screens/LoginScreen.dart';
import 'package:app_12/screens/RegistroScreen.dart';
import 'package:app_12/screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
 
//Supabase
import 'package:supabase_flutter/supabase_flutter.dart';
 
Future<void> main() async {
 
await Supabase.initialize(
    url: 'https://mkslowcmsgaongdibanz.supabase.co',
    publishableKey: 'sb_publishable_1m_eE339oYDa6yf4hpIDyw_swg4qHtP',
  );
  runApp(const AppFire());
}
final supabase = Supabase.instance.client;
 
class AppFire extends StatefulWidget {
  const AppFire({super.key});

  @override
  State<AppFire> createState() => _AppFireState();
}

class _AppFireState extends State<AppFire> {

  bool modoOscuro = true;

  void cambiarTema(){
    setState(() {
      modoOscuro = !modoOscuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: modoOscuro ? ThemeData.dark() : ThemeData.light(),
      initialRoute: "/guardar",
      routes: {
        "/": (context) => Welcomescreen(cambiarTema),
        "/login": (context) => Loginscreen(),
        "/registro": (context) => RegistroScreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => Leerscreen(),
        "/detalles": (context) => Detallesscreen(),
      },
    );
  }
}