import 'package:usa_observer_app/network/population/models/models.dart';
import 'package:usa_observer_app/network/population/population_api.dart';

class PopulationRepository {
  final PopulationApi _api;

  PopulationRepository(this._api);

  Future<List<PopulationModel>> getPopulation() async {
    final json = await _api.fetchPopulation();
    return PopulationMapper.fromApi(json);
  }
}
