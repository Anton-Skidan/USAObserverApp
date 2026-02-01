import 'package:flutter_riverpod/legacy.dart';
import 'package:usa_observer_app/features/population_screen/state_notifier/population_state.dart';
import 'package:usa_observer_app/network/population/population_network.dart';

class PopulationNotifier extends StateNotifier<PopulationState> {
  PopulationNotifier(this._repository) : super(const PopulationLoading()) {
    loadPopulation();
  }

  final PopulationRepository _repository;

  Future<void> loadPopulation() async {
    try {
      state = const PopulationLoading();
      final data = await _repository.getPopulation();
      state = PopulationLoaded(data);
    } catch (error) {
      state = const PopulationError(
        'Unable to load population data. Please try again later.',
      );
    }
  }

  Future<void> refresh() async {
    await loadPopulation();
  }
}
