import 'package:usa_observer_app/network/population/models/population_model.dart';

class PopulationMapper {
  static List<PopulationModel> fromApi(List<dynamic> json) {
    return json
        .whereType<Map<String, dynamic>>()
        .map(PopulationModel.fromJson)
        .toList();
  }
}
