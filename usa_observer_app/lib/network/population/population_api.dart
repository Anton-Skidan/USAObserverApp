import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/network/population/models/models.dart';

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

    debugPrint('--- POPULATION REQUEST ---');
    debugPrint('GET $uri');

    final response = await _client.get(uri);

    debugPrint('STATUS CODE: ${response.statusCode}');
    debugPrint('BODY (first 200): ${response.body.substring(0, 200)}');

    if (response.statusCode != 200) {
      throw Exception('Failed to load population');
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}
