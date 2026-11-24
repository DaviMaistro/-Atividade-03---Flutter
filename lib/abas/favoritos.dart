import 'package:flutter/material.dart';
import '../template.dart';
import '../dados.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'Favoritos',
      selectedIndex: 1,
      body: favoritos.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 60),
            SizedBox(height: 10),
            Text('Você ainda não tem pratos favoritos'),
          ],
        ),
      )
          : ListView.builder(
        itemCount: favoritos.length,
        itemBuilder: (context, i) {
          final prato = favoritos[i];
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: Image.network(
                prato['imagem']!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
              ),
            ),
            title: Text(prato['nome']!),
          );
        },
      ),
    );
  }
}