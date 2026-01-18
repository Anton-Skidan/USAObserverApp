import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/features/population_screen/views/population_title.dart';
import 'package:usa_observer_app/network/population/population_network.dart';

class PopulationScreen extends StatelessWidget {
  const PopulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = PopulationRepository(PopulationApi(http.Client()));

    return Scaffold(
      appBar: AppBar(title: const Text('Population')),
      body: FutureBuilder<List<PopulationModel>>(
        future: repository.getPopulation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading data',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }

          final data = snapshot.data;

          if (data == null || data.isEmpty) {
            return const Center(child: Text('No data'));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: data.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final item = data[index];
              final isLatest = index == 0;

              return PopulationTile(model: item, highlight: isLatest);
            },
          );
        },
      ),
    );
  }
}
