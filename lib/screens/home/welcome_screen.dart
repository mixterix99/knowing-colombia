import 'dart:ui'; // Necesario para el filtro de desenfoque
import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/bandera.webp', // Ruta de la bandera de Colombia
              height: 20,
            ),
            const SizedBox(width: 10),
            // Usamos Expanded para que el texto se ajuste al espacio disponible
            const Expanded(
              child: Text(
                'Knowing Colombia!',
                overflow: TextOverflow.ellipsis, // Correcto
                style: TextStyle(
                  // Otros estilos si es necesario
                  fontSize: 15,
                  fontWeight: FontWeight.bold, // Puedes ajustar el tamaño según sea necesario
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Cambiar Idioma') {
                Navigator.pushNamed(context, '/cambiar-idioma');
              } else if (value == 'Reportar Fallas') {
                Navigator.pushNamed(context, '/reportar-fallas');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Cambiar Idioma',
                  child: Text('Cambiar Idioma'),
                ),
                const PopupMenuItem<String>(
                  value: 'Reportar Fallas',
                  child: Text('Reportar Fallas/Bugs'),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert), // Icono de tres puntos
          ),
        ],
      ),
      body: Stack(
        children: [
          // Imagen de fondo con opacidad y desenfoque
          Positioned.fill(
            child: Opacity(
              opacity: 0.9, // Ajustar la opacidad (0.0 a 1.0)
              child: Image.asset(
                'assets/images/cali.webp', // Asegúrate de que esta ruta sea correcta
                fit: BoxFit.cover, // La imagen cubrirá toda la pantalla
              ),
            ),
          ),
          // Desenfoque aplicado sobre la imagen
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 3, sigmaY: 3), // Ajustar la intensidad del desenfoque
              child: Container(
                color: Colors.black.withOpacity(0.1), // Tinte semitransparente
              ),
            ),
          ),
          // Contenido sobre la imagen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centrado horizontal
              children: [
                // Texto de bienvenida centrado
                const Text(
                  '¡Bienvenido a Conociendo ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
                  
                ),
                // Texto "Colombia" con los colores de la bandera centrado
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'COL',
                        style: TextStyle(
                          color: Colors.yellow[700], // Amarillo
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'OM',
                        style: TextStyle(
                          color: Colors.blue[800], // Azul
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'BIA!',
                        style: TextStyle(
                          color: Colors.red[700], // Rojo
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Botón de "Iniciar sesión"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Iniciar sesión'),
                ),
                const SizedBox(height: 10),
                // Botón de "Registrarse"
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Registrarse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
