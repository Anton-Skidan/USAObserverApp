import 'package:usa_observer_app/network/employment/models/employment_model.dart';

sealed class EmploymentState {
  const EmploymentState();
}

class EmploymentLoading extends EmploymentState {
  const EmploymentLoading();
}

class EmploymentLoaded extends EmploymentState {
  final List<EmploymentModel> data;

  const EmploymentLoaded(this.data);
}

class EmploymentError extends EmploymentState {
  final String message;

  const EmploymentError(this.message);
}
