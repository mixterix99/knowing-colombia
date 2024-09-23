import 'package:flutter/material.dart';
import 'package:knowing_my_city/screens/home/cambiar_idioma_screen.dart';
import 'package:knowing_my_city/screens/home/reportar_fallas_screen.dart';
import 'package:knowing_my_city/screens/home/welcome_screen.dart'; // Asegúrate de importar las pantallas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Knowing My City',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const Scaffold(body: Center(child: Text('Login Page'))), // Reemplaza con tu pantalla de login
        '/register': (context) => const Scaffold(body: Center(child: Text('Register Page'))), // Reemplaza con tu pantalla de registro
        '/cambiar-idioma': (context) => const CambiarIdiomaScreen(),
        '/reportar-fallas': (context) => const ReportarFallasScreen(),
      },
    );
  }
}
