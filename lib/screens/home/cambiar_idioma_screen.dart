import 'package:flutter/material.dart';

class CambiarIdiomaScreen extends StatelessWidget {
  const CambiarIdiomaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Idioma'),
      ),
      body: const Center(
        child: Text('Aquí puedes implementar el cambio de idioma'),
      ),
    );
  }
}