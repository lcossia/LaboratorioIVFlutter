import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GenreScreen extends StatelessWidget {
  GenreScreen({Key? key}) : super(key: key);

  final List<String> genres = [
    'Acción',
    'Comedia',
    'Drama',
    'Aventura',
    'Animación'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Géneros'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: ListView.builder(
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genreName = genres[index];
          return ListTile(
            title: Text(genreName),
            onTap: () {
              _showGenreDetails(context, genreName);
            },
          );
        },
      ),
    );
  }

  void _showGenreDetails(BuildContext context, String genreName) async {
    String generoMandar = "";
    String generoEnglish = "";
    if (genreName == "Acción") {
      generoMandar = "accion";
      generoEnglish = "Action";
    } else if (genreName == "Comedia") {
      generoMandar = "comedia";
      generoEnglish = "Comedy";
    } else if (genreName == "Drama") {
      generoMandar = "drama";
      generoEnglish = "Drama";
    } else if (genreName == "Aventura") {
      generoMandar = "aventura";
      generoEnglish = "Adventure";
    } else if (genreName == "Animación") {
      generoMandar = "animacion";
      generoEnglish = "Animation";
    }

    final url =
        'https://peliculas-info.onrender.com/peliculas/genero/${generoMandar.toLowerCase()}';

    showDialog(
      context: context,
      builder: (context) => const Center(
          child: CircularProgressIndicator()), // Indicador de carga
      barrierDismissible:
          false, // Evita que el diálogo sea cerrado tocando fuera de él
    );

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'x-flutter-app': 'true'},
      );

      Navigator.pop(context); // Cerrar el indicador de carga

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        List<String> movieNames = List<String>.from(data['nombre_peliculas']);
        List<String> generosLista = List<String>.from(data['generos_lista']);

        List<String> moviesWithGenre = [];
        // Iterar sobre las películas y sus géneros
        for (int i = 0; i < movieNames.length; i++) {
          // Verificar si la película tiene el género seleccionado
          if (generosLista[i]
              .toLowerCase()
              .contains(generoEnglish.toLowerCase())) {
            // Agregar la película a la lista de películas relevantes
            moviesWithGenre.add(movieNames[i]);
          }
        }

        // Mostrar el JSON obtenido en un diálogo
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Películas para el género $genreName'),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: moviesWithGenre.map((movieName) {
                    return Text(movieName);
                  }).toList(),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      } else {
        // Mostrar mensaje de error si la solicitud falla
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Películas no encontradas'),
              content: const Text(
                  'No se encontró ninguna película, vuelva a intentar buscar.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cerrar'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Mostrar mensaje de error si ocurre un error inesperado
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('An unexpected error occurred'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }
}
