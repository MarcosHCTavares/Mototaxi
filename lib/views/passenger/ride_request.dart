import 'package:flutter/material.dart';
import '../../services/location_service.dart';

class RideRequestScreen extends StatefulWidget {
  const RideRequestScreen({super.key});

  @override
  State<RideRequestScreen> createState() => _RideRequestScreenState();
}

class _RideRequestScreenState extends State<RideRequestScreen> {
  final TextEditingController _destinationController = TextEditingController();
  final LocationService locationService = LocationService();

  String _distance = '';
  String _duration = '';
  String _price = '';
  bool _loading = false;

  void _calculateRoute() async {
    final destination = _destinationController.text;
    const origin = 'Vitória, ES'; // Substituir depois pela localização real

    if (destination.isEmpty) return;

    setState(() {
      _loading = true;
    });

    try {
      final result = await locationService.getDirections(origin, destination);

      if (result != null) {
        setState(() {
          _distance = result['distance'];
          _duration = result['duration'];

          final distanceKm =
              double.tryParse(_distance.replaceAll(RegExp('[^0-9.]'), '')) ??
                  0;
          final value = 2.5 + (distanceKm * 1.0);
          _price = 'R\$ ${value.toStringAsFixed(2)}';
        });
      } else {
        _showError('Destino não encontrado.');
      }
    } catch (e) {
      _showError('Erro ao calcular rota.');
    }

    setState(() {
      _loading = false;
    });
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _confirmRide() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Corrida Solicitada'),
        content: Text('Distância: $_distance\nValor: $_price\nTempo: $_duration'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Corrida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _destinationController,
              decoration: const InputDecoration(
                labelText: 'Digite seu destino',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateRoute,
              child: _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Calcular Rota'),
            ),
            const SizedBox(height: 20),
            if (_distance.isNotEmpty) ...[
              Text('Distância: $_distance'),
              Text('Tempo estimado: $_duration'),
              Text('Preço estimado: $_price'),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _confirmRide,
                icon: const Icon(Icons.motorcycle),
                label: const Text('Confirmar Corrida'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
