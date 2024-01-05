import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//Hola Hago cambios 
// :)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Persona estudiante = Persona(nombre: "Nicolas Barnuevo")..setEdad(20);

  void mostrarInformacion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text('Examen 21 de diciembre programación móvil\nNombre: ${estudiante.nombre} ${estudiante.apellido}'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  void mostrarAgradecimiento(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gracias'),
          content: Text('¡Gracias por utilizar la aplicación!'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Cerrar la aplicación al presionar el botón "OK"
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Fondo rojo
              ),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.white, // Texto blanco
                  fontSize: 18,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.indigo,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Examen Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                mostrarInformacion(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Center(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  estudiante.toString(),
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          color: Colors.indigo,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                mostrarAgradecimiento(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Fondo rojo
              ),
              child: Text(
                'Exit',
                style: TextStyle(
                  color: Colors.white, // Texto blanco
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Persona {
  String nombre;
  String apellido;
  int edad;

  Persona({required this.nombre, this.apellido = '', this.edad = 0});

  factory Persona.edad(int edad) {
    return Persona(nombre: '', apellido: '', edad: edad);
  }

  void setEdad(int edad) {
    this.edad = edad;
  }

  @override
  String toString() {
    return '$nombre $apellido - Edad: $edad años';
  }
}
