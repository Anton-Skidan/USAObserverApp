import 'dart:convert';
import 'package:http/http.dart' as http;

class IncomeApi {
  final http.Client _client;

  IncomeApi(this._client);

  Future<Map<String, dynamic>> fetchIncomeRaw() async {
    final uri = Uri.https('api.datausa.io', '/tesseract/data.jsonrecords', {
      'cube': 'acs_yg_household_income_5',
      'measures': 'Household Income',
      'include': 'Year:2023',
      'drilldowns': 'State,Year',
    });

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load household income data');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
