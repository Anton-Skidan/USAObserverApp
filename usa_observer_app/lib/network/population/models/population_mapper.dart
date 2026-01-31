import 'package:usa_observer_app/network/population/models/population_model.dart';

class PopulationMapper {
  static List<PopulationModel> fromApi(List<dynamic> json) {
    return json.map((item) {
      final map = item as Map<String, dynamic>;

      return PopulationModel(
        state: map['State'] as String,
        year: (map['Year'] as num).toInt(),
        population: (map['Population'] as num).toInt(),
      );
    }).toList();
  }
}