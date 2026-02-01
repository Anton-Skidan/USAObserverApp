import 'package:usa_observer_app/network/economy/income/models/models.dart';

sealed class IncomeState {
  const IncomeState();
}

class IncomeLoading extends IncomeState {
  const IncomeLoading();
}

class IncomeLoaded extends IncomeState {
  final List<IncomeModel> data;
  const IncomeLoaded(this.data);
}

class IncomeError extends IncomeState {
  final String errorMessage;
  const IncomeError(this.errorMessage);
}
