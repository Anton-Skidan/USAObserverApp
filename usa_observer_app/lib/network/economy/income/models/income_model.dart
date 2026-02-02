class IncomeModel {
  final String state;
  final int year;
  final int householdCount;

  const IncomeModel({
    required this.state,
    required this.year,
    required this.householdCount,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      state: json['State'] as String,
      year: (json['Year'] as num).toInt(),
      householdCount: (json['Household Income'] as num).toInt(),
    );
  }
}
