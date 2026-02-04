import 'package:flutter_riverpod/legacy.dart';
import 'package:usa_observer_app/features/employment_screen/state_notifier/employment_state.dart';
import 'package:usa_observer_app/network/employment/employment_repository.dart';

class EmploymentNotifier extends StateNotifier<EmploymentState> {
  EmploymentNotifier(this._repository) : super(const EmploymentLoading()) {
    loadEmployment();
  }

  final EmploymentRepository _repository;

  Future<void> loadEmployment() async {
    try {
      state = const EmploymentLoading();
      final data = await _repository.getEmployment();
      state = EmploymentLoaded(data);
    } catch (e) {
      state = const EmploymentError('Failed to load employment data');
    }
  }

  Future<void> refresh() async {
    await loadEmployment();
  }
}
