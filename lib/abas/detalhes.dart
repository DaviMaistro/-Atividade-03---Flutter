import 'package:flutter/material.dart';
import '../template.dart';
import '../botão.dart';
import '../dados.dart';

class DetalhesPage extends StatefulWidget {
  final Map<String, String> prato;

  const DetalhesPage({super.key, required this.prato});

  @override
  State<DetalhesPage> createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> {
  void favoritar() {
    setState(() {
      if (favoritos.contains(widget.prato)) {
        favoritos.remove(widget.prato);
      } else {
        favoritos.add(widget.prato);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final prato = widget.prato;
    bool favorito = favoritos.contains(prato);

    return BaseTemplate(
      titulo: prato['nome']!,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              prato['imagem']!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 16),
            Text(prato['nome']!, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text(prato['desc']!),
            const SizedBox(height: 24),
            AppButton(
              texto: favorito ? 'Remover dos favoritos' : 'Favoritar',
              onPressed: favoritar,
            ),
            AppButton(
              texto: 'Voltar',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}