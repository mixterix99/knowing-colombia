import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = [
    'Hoteles', 'Restaurantes', 'Balnearios', 'Discotecas',
    'Cafeterías', 'Minimarkets', 'Puntos de interés', 'Otro'
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elige una categoría')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            onTap: () {
              // Navegar a la pantalla de chat y pasar la categoría seleccionada
              Navigator.pushNamed(
                context,
                '/chat',
                arguments: categories[index], // Pasamos la categoría seleccionada
              );
            },
          );
        },
      ),
    );
  }
}