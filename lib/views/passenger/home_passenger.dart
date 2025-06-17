import 'package:flutter/material.dart';

class HomePassenger extends StatelessWidget {
  const HomePassenger({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Área do Passageiro'),
      ),
      body: const Center(
        child: Text('Bem-vindo!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/passenger/ride-request');
        },
        child: const Icon(Icons.motorcycle),
      ),
    );
  }
}
