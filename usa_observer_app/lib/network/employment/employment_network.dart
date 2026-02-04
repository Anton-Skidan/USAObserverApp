import 'package:usa_observer_app/network/employment/employment_api.dart';

class EmploymentNetwork {
  final EmploymentApi _api;

  EmploymentNetwork(this._api);

  Future<Map<String, dynamic>> getEmploymentRaw() {
    return _api.fetchEmploymentRaw();
  }
}
