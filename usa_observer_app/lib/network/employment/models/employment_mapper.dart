import 'package:usa_observer_app/network/employment/models/employment_model.dart';

class EmploymentMapper {
  static List<EmploymentModel> fromApi(List<dynamic> raw) {
    return raw
        .whereType<Map<String, dynamic>>()
        .map(EmploymentModel.fromJson)
        .toList();
  }
}
