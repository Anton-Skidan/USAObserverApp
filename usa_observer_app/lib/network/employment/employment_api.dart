import 'dart:convert';
import 'package:http/http.dart' as http;

class EmploymentApi {
  final http.Client _client;

  EmploymentApi(this._client);

  Future<Map<String, dynamic>> fetchEmploymentRaw() async {
    final uri = Uri.https('api.datausa.io', '/tesseract/data.jsonrecords', {
      'cube': 'acs_ygsi_gender_by_industry_c_5',
      'drilldowns': 'Industry',
      'measures': 'Workforce',
    });

    final response = await _client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load employment data');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
