import 'package:flutter/material.dart';
import 'abas/home.dart';
import 'abas/favoritos.dart';
import 'abas/perfil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/favoritos': (context) => const FavoritosPage(),
        '/perfil': (context) => const PerfilPage(),
      },
    );
  }
}