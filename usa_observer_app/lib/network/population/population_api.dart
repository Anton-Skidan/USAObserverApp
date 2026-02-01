import 'dart:convert';
import 'package:http/http.dart' as http;

class PopulationApi {
  final http.Client _client;

  PopulationApi(this._client);

  Future<Map<String, dynamic>> fetchPopulationRaw() async {
    final uri = Uri.https('api.datausa.io', '/tesseract/data.jsonrecords', {
      'cube': 'acs_yg_total_population_5',
      'measures': 'Population',
      'include': 'Year:2023',
      'drilldowns': 'State,Year',
    });

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        'Population request failed with status ${response.statusCode}',
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
