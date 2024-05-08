import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DirectorsPage extends StatelessWidget {
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('https://peliculas-info.onrender.com/peliculas/directores'),
      headers: {'x-flutter-app': 'true'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Directores'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtiene la data
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si hay algún problema al cargar la data
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            // Construye la interfaz de acuerdo a la data obtenida
            final data = snapshot.data!;
            final movieNames = List<String>.from(data['nombre_peliculas']);
            final directorNames = List<String>.from(data['directores_lista']);
            return ListView.builder(
              itemCount: movieNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(movieNames[index]),
                  onTap: () {
                    // Muestra un diálogo con los directores cuando se toque un elemento de la lista
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(movieNames[index]),
                          content: Text('Directores: ${directorNames[index]}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cerrar'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
