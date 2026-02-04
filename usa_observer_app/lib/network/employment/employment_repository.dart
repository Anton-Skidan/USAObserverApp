import 'package:flutter/cupertino.dart';
import 'package:usa_observer_app/network/employment/employment_api.dart';
import 'package:usa_observer_app/network/employment/models/employment_mapper.dart';
import 'package:usa_observer_app/network/employment/models/employment_model.dart';

class EmploymentRepository {
  final EmploymentApi _api;

  EmploymentRepository(this._api);

  Future<List<EmploymentModel>> getEmployment() async {
    final json = await _api.fetchEmploymentRaw();

    final data = json['data'];
    debugPrint('Employment raw data: $data');
    if (data is! List) {
      throw Exception('Employment data is missing');
    }

    final mapped = EmploymentMapper.fromApi(data);
    if (mapped.isEmpty) {
      throw Exception('Employment data is empty');
    }

    return mapped;
  }
}
