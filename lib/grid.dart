import 'package:flutter/material.dart';

class PratoCard extends StatelessWidget {
  final String emoji;
  final String nome;
  final String desc;
  final VoidCallback onTap;

  const PratoCard({
    super.key,
    required this.emoji,
    required this.nome,
    required this.desc,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(emoji, style: const TextStyle(fontSize: 30)),
      title: Text(nome),
      subtitle: Text(desc),
      onTap: onTap,
    );
  }
}