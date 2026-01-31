class PopulationModel {
  final String state;
  final int year;
  final int population;

  PopulationModel({
    required this.state,
    required this.year,
    required this.population,
  });

factory PopulationModel.fromJson(Map<String, dynamic> json) {
  return PopulationModel(
    state: json['State'] as String,
    year: (json['Year'] as num).toInt(),
    population: (json['Population'] as num).toInt(),
  );
}
}
