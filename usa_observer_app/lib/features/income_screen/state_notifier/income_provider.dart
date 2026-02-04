import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/features/income_screen/state_notifier/income_notifier.dart';
import 'package:usa_observer_app/features/income_screen/state_notifier/income_state.dart';
import 'package:usa_observer_app/network/economy/income/income_api.dart';
import 'package:usa_observer_app/network/economy/income/income_repository.dart';

final incomeProvider = StateNotifierProvider<IncomeNotifier, IncomeState>((
  ref,
) {
  final repository = IncomeRepository(IncomeApi(http.Client()));
  return IncomeNotifier(repository);
});
