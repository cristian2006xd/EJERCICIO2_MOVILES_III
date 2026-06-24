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
 
class AppFire extends StatelessWidget {
  const AppFire({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => Welcomescreen(),
        "/login": (context) => Loginscreen(),
        "/registro": (context) => RegistroScreen(),
        "/guardar": (context) => Guardarscreen(),
        "/leer": (context) => Leerscreen(),
        "/detalles": (context) => Detallesscreen(),
      },
    );
  }
}