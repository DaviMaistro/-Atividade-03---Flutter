import 'package:flutter/material.dart';
import '../template.dart';

const String fotoPerfil = 'https://media.licdn.com/dms/image/v2/D4D03AQGSVUUMd7nZJg/profile-displayphoto-scale_400_400/B4DZ9HVj7iK0Ao-/0/1783608266480?e=1796860800&v=beta&t=pzlw_Vv_ScujNrcwvgp4YsBsl3aK8OWwBP3Ru-G-Hao';
//tirei do seu linkedin professor, n sou stalker n

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      titulo: 'Perfil',
      selectedIndex: 2,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(fotoPerfil),
            ),
            const SizedBox(height: 16),
            const Text(
              'João Marcos',
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}