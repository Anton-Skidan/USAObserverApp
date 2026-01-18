import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/network/population/models/models.dart';

class PopulationApi {
  final http.Client _client;

  PopulationApi(this._client);

  Future<List<PopulationModel>> fetchPopulation() async {
    final uri = Uri.https(
      'api.datausa.io',
      '/api/data',
      {
        'drilldowns': 'Nation',
        'measures': 'Population',
        'limit': '20',
      },
    );

    debugPrint('--- POPULATION REQUEST ---');
    debugPrint('GET $uri');

    final response = await _client.get(
      uri,
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'USAObserver/1.0 (Flutter)',
      },
    ).timeout(const Duration(seconds: 15));

    debugPrint('STATUS CODE: ${response.statusCode}');

    if (response.statusCode != 200) {
      debugPrint(response.body);
      throw Exception('Population request failed');
    }

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final data = decoded['data'] as List<dynamic>;

    return data
        .map((e) => PopulationModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}