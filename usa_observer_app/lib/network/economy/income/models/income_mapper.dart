import 'package:usa_observer_app/network/economy/income/models/income_model.dart';

class IncomeMapper {
  static List<IncomeModel> fromApi(List<dynamic> data) {
    return data
        .whereType<Map<String, dynamic>>()
        .map(IncomeModel.fromJson)
        .toList();
  }
}
