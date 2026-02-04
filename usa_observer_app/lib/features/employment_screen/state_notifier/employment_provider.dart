import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'package:usa_observer_app/features/employment_screen/state_notifier/employment_notifier.dart';
import 'package:usa_observer_app/features/employment_screen/state_notifier/employment_state.dart';
import 'package:usa_observer_app/network/employment/employment_api.dart';
import 'package:usa_observer_app/network/employment/employment_repository.dart';

final employmentProvider =
    StateNotifierProvider<EmploymentNotifier, EmploymentState>((ref) {
      final api = EmploymentApi(http.Client());
      final repository = EmploymentRepository(api);

      return EmploymentNotifier(repository);
    });
