import 'package:flutter/material.dart';

class Welcomescreen extends StatelessWidget {
  final cambiarTema;
  const Welcomescreen( this.cambiarTema,{ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => cambiarTema(), 
          icon: Icon(Icons.brightness_1)),
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://4kwallpapers.com/images/walls/thumbs_2t/26357.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, "/login"),
                child: Text("Login"),
              ),

              FilledButton(
                onPressed: () => Navigator.pushNamed(context, "/registro"),
                child: Text("Registro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
