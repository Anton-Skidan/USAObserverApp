import 'package:flutter_riverpod/legacy.dart';
import 'package:usa_observer_app/features/income_screen/state_notifier/income_state.dart';
import 'package:usa_observer_app/network/economy/income/income_repository.dart';

class IncomeNotifier extends StateNotifier<IncomeState> {
  IncomeNotifier(this._repository) : super(const IncomeLoading()) {
    loadIncome();
  }

  final IncomeRepository _repository;

  Future<void> loadIncome() async {
    try {
      state = const IncomeLoading();
      final data = await _repository.getIncome();
      state = IncomeLoaded(data);
    } catch (_) {
      state = const IncomeError('Failed to load household income data');
    }
  }

  Future<void> refresh() async {
    await loadIncome();
  }
}
