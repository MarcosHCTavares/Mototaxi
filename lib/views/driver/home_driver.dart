import 'package:flutter/material.dart';

class HomeDriver extends StatelessWidget {
  const HomeDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Área do Mototaxista'),
      ),
      body: const Center(
        child: Text('Aguardando solicitações de corrida...'),
      ),
    );
  }
}
