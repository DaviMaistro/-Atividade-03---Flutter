import 'package:flutter/material.dart';
import '../template.dart';
import '../botão.dart';
import '../dados.dart';
import 'detalhes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController campo = TextEditingController();

  String erro = '';
  String termo = '';

  void pesquisar() {
    String texto = campo.text.trim().replaceAll(RegExp(r'\s+'), ' ');

    if (texto.isEmpty) {
      setState(() {
        erro = 'Digite o nome de uma receita antes de pesquisar. Exemplo: bolo de cenoura.';
        termo = '';
      });
      return;
    }

    setState(() {
      erro = '';
      termo = texto;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'Receitas',
      selectedIndex: 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: campo,
            onSubmitted: (valor) => pesquisar(),
            decoration: const InputDecoration(
              labelText: 'Nome da receita',
            ),
          ),
          const SizedBox(height: 10),
          AppButton(
            texto: 'Pesquisar',
            onPressed: pesquisar,
          ),
          const SizedBox(height: 10),

          if (erro != '')
            Text(erro, style: const TextStyle(color: Colors.red)),

          if (termo != '')
            Text('Você pesquisou por: $termo'),

          const SizedBox(height: 10),
          const Text(
            'Pratos populares',
            style: TextStyle(fontSize: 20),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: pratos.length,
              itemBuilder: (context, i) {
                final prato = pratos[i];
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetalhesPage(prato: prato),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}