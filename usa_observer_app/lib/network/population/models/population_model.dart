class PopulationModel {
  final String nation;
  final int year;
  final int population;

  PopulationModel({
    required this.nation,
    required this.year,
    required this.population,
  });

    factory PopulationModel.fromJson(Map<String, dynamic> json) {
      return PopulationModel(
        nation: json['Nation'] as String,
        year: int.parse(json['Year']),
        population: json['Population'] as int,
      );
    }
  }