import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String category;

  ChatScreen({required this.category});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    _setInitialMessage(); // Configurar el mensaje inicial basado en la categoría
  }

  void _setInitialMessage() {
    String initialMessage;

    switch (widget.category) {
      case 'Hoteles':
        initialMessage = 'Aquí están los 5 hoteles mejor valorados cerca de ti...';
        break;
      case 'Restaurantes':
        initialMessage = 'Aquí están los 5 restaurantes mejor valorados cerca de ti...';
        break;
      case 'Balnearios':
        initialMessage = 'Aquí están los 5 balnearios mejor valorados cerca de ti...';
        break;
      case 'Discotecas':
        initialMessage = 'Aquí están las 5 discotecas más populares cerca de ti...';
        break;
      case 'Cafeterías':
        initialMessage = 'Aquí están las 5 cafeterías mejor valoradas cerca de ti...';
        break;
      case 'Minimarkets':
        initialMessage = 'Aquí están los 5 minimarkets más recomendados cerca de ti...';
        break;
      case 'Puntos de interés':
        initialMessage = 'Aquí están los 5 puntos de interés más populares cerca de ti...';
        break;
      default:
        initialMessage = 'Aquí está la información más relevante para ti...';
    }

    // Añadir el mensaje inicial a la lista de mensajes
    setState(() {
      messages.add(initialMessage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Asistente virtual - ${widget.category}',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Lista de mensajes
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = index.isOdd; // Alterna entre IA y usuario
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.blueAccent
                          : Colors.grey[300], // Diferentes colores
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(
                        color: isUserMessage ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Campo de texto y botón para enviar
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Controlador para el campo de texto
  final TextEditingController _controller = TextEditingController();

  // Lógica para enviar el mensaje
  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text); // Agregar el mensaje del usuario
        _controller.clear(); // Limpiar el campo de texto
      });

      // Aquí puedes agregar una función para recibir respuesta de la IA
      _receiveResponseFromAI();
    }
  }

  // Lógica para simular una respuesta de la IA
  void _receiveResponseFromAI() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add('Este es un mensaje de respuesta de la IA.');
      });
    });
  }
}
