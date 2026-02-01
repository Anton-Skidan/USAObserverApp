import 'package:usa_observer_app/network/population/models/models.dart';

sealed class PopulationState {
  const PopulationState();
}

class PopulationInitial extends PopulationState {
  const PopulationInitial();
}

class PopulationLoading extends PopulationState {
  const PopulationLoading();
}

class PopulationLoaded extends PopulationState {
  final List<PopulationModel> data;

  const PopulationLoaded(this.data);
}

class PopulationError extends PopulationState {
  final String message;

  const PopulationError(this.message);
}
