import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/features/population_screen/population_notifier.dart';
import 'package:usa_observer_app/features/population_screen/population_state.dart';
import 'package:usa_observer_app/network/population/population_network.dart';

final populationProvider =
    StateNotifierProvider<PopulationNotifier, PopulationState>(
  (ref) {
    final repository = PopulationRepository(
      PopulationApi(http.Client()),
    );
    return PopulationNotifier(repository);
  },
);