import 'package:usa_observer_app/network/population/models/population_model.dart';

class PopulationMapper {
  static List<PopulationModel> fromApi(Map<String, dynamic> json) {
    final data = json['data'] as List<dynamic>;

    return data.map((item) {
      return PopulationModel(
        year: int.parse(item['Year'] as String),
        population: item['Population'] as int, nation: '',
      );
    }).toList();
  }
}
