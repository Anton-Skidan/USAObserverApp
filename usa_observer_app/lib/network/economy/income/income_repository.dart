import 'package:usa_observer_app/network/economy/income/income_api.dart';
import 'package:usa_observer_app/network/economy/income/models/models.dart';

class IncomeRepository {
  final IncomeApi _api;

  IncomeRepository(this._api);

  Future<List<IncomeModel>> getIncome() async {
    final json = await _api.fetchIncomeRaw();

    final raw = json['data'];
    if (raw is! List) return [];

    final mapped = IncomeMapper.fromApi(raw);
    if (mapped.isEmpty) {
      throw Exception('Income data is empty or missing');
    }

    return mapped;
  }
}
