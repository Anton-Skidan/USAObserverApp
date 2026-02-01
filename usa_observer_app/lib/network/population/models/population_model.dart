class PopulationModel {
  final String state;
  final int year;
  final int population;

  const PopulationModel({
    required this.state,
    required this.year,
    required this.population,
  });

  factory PopulationModel.fromJson(Map<String, dynamic> json) {
    return PopulationModel(
      state: json['State'] as String? ?? 'Unknown',
      year: (json['Year'] as num?)?.toInt() ?? 0,
      population: (json['Population'] as num?)?.toInt() ?? 0,
    );
  }
}
