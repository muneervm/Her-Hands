import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Color.fromARGB(255, 4, 36, 90),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Lottie.network(
          'https://lottie.host/b62bba58-7c71-457d-a5bc-5bb903f6bfe9/bJoLSku9N7.json',
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
