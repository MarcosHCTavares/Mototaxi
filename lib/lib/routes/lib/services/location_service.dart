import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationService {
  final String apiKey = 'SUA_API_KEY_AQUI';

  Future<Map<String, dynamic>?> getDirections(
      String origin, String destination) async {
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if ((data['routes'] as List).isNotEmpty) {
        final route = data['routes'][0];
        final leg = route['legs'][0];

        return {
          'distance': leg['distance']['text'],
          'duration': leg['duration']['text'],
          'start_address': leg['start_address'],
          'end_address': leg['end_address'],
        };
      } else {
        return null;
      }
    } else {
      throw Exception('Erro ao buscar direções');
    }
  }
}
