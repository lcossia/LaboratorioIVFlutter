import 'package:flutter/material.dart';
import 'package:flutter_repo_guide/helpers/preferences.dart';
import 'package:flutter_repo_guide/providers/theme_provider.dart';
import 'package:flutter_repo_guide/screens/directors_screen.dart';
import 'package:flutter_repo_guide/screens/genres_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'screens/screens.dart';

void main() async {
  // TODO: Comentar
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  await Preferences.initShared();

  // runApp(const MyApp());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOP Peliculas',
      // theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(),
      theme: Provider.of<ThemeProvider>(context, listen: true).temaActual,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (context) => HomeScreen(),
        'directors': (context) => DirectorsPage(),
        'genres': (context) => GenreScreen(),
        'profile': (context) => const ProfileScreen(),
        'form_screen': (context) => const FormScreen(),
      },
    );
  }
}
