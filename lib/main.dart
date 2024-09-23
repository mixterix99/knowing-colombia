import 'package:flutter/material.dart';
import 'package:knowing_my_city/screens/home/cambiar_idioma_screen.dart';
import 'package:knowing_my_city/screens/home/chat.dart';
import 'package:knowing_my_city/screens/home/login.dart';
import 'package:knowing_my_city/screens/home/register.dart';
import 'package:knowing_my_city/screens/home/reportar_fallas_screen.dart';
import 'package:knowing_my_city/screens/home/welcome_screen.dart';
import "package:knowing_my_city/screens/home/categories.dart"; // Asegúrate de importar las pantallas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knowing Colombia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/category': (context) => CategoryScreen(),
      },
      // Define una función onGenerateRoute para manejar la navegación con argumentos
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final String category = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return ChatScreen(category: category); // Pasa la categoría al ChatScreen
            },
          );
        }
        return null;
      },
    );
  }
}