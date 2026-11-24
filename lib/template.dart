import 'package:flutter/material.dart';

class BaseTemplate extends StatelessWidget {
  final String titulo;
  final Widget body;
  final int? selectedIndex;

  const BaseTemplate({
    super.key,
    required this.titulo,
    required this.body,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    const rotas = ['/', '/favoritos', '/perfil'];

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: body,
      ),
      bottomNavigationBar: selectedIndex == null
          ? null
          : BottomNavigationBar(
        currentIndex: selectedIndex!,
        onTap: (i) {
          Navigator.pushReplacementNamed(context, rotas[i]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}