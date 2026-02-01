class IncomeModel {
  final String state;
  final int year;
  final int medianIncome;

  const IncomeModel({
    required this.state,
    required this.year,
    required this.medianIncome,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      state: json['State'] as String,
      year: (json['Year'] as num).toInt(),
      medianIncome:
          (json['Median Household Income'] as num).toInt(),
    );
  }
}
