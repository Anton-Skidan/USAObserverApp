import 'package:usa_observer_app/network/economy/income/models/income_model.dart';

class IncomeMapper {
  static List<IncomeModel> fromApi(List<dynamic> json) {
    return json
        .where(
          (e) =>
              e is Map<String, dynamic> &&
              e.containsKey('Median Household Income'),
        )
        .map((item) {
          final map = item as Map<String, dynamic>;

          return IncomeModel(
            state: map['State'] as String,
            year: (map['Year'] as num).toInt(),
            medianIncome: (map['Median Household Income'] as num)
                .toInt(),
          );
        })
        .toList();
  }
}
