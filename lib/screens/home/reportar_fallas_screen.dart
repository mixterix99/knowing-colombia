import 'package:flutter/material.dart';

class ReportarFallasScreen extends StatelessWidget {
  const ReportarFallasScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('Reportar Fallas/Bugs'),
      ),
      body: const Center(
        child: Text('Describe la falla o bug que encontraste'),
      ),
    );
  }
}