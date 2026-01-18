import 'dart:convert';
import 'package:http/http.dart' as http;

class PopulationApi {
  static const _baseUrl = 'https://datausa.io/api';

  final http.Client _client;

  PopulationApi(this._client);

  Future<Map<String, dynamic>> fetchPopulation() async {
    final uri = Uri.parse(
      '$_baseUrl/data'
      '?drilldowns=Nation'
      '&measures=Population',
    );

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load population data');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
