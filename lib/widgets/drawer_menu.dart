import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Peliculas mas solicitadas'},
    {
      'route': 'directors',
      'title': 'Directores',
      'subtitle': 'Apartado exclusivo para directores'
    },
    {
      'route': 'genres',
      'title': 'Generos',
      'subtitle': 'Lista con generos cinematograficos'
    },
    {'route': 'profile', 'title': 'Login', 'subtitle': 'Logeate con tu cuenta'},
    {
      'route': 'form_screen',
      'title': 'Registrarse',
      'subtitle': 'Registrate en la plataforma'
    },
  ];

  DrawerMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHIJiMv-gjUZSEjy4KmItsOTgscCOctneo7Q&usqp=CAU',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(),
          ),
          ...ListTile.divideTiles(
            context: context,
            tiles: _menuItems
                .map((item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
                      dense: true,
                      minLeadingWidth: 25,
                      title: Text(
                        item['title']!,
                        style: const TextStyle(
                          fontFamily: 'FuzzyBubbles',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        item['subtitle'] ?? '',
                        style: const TextStyle(
                          fontFamily: 'RobotoMono',
                          fontSize: 12,
                        ),
                      ),
                      leading: const Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, item['route']!);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
