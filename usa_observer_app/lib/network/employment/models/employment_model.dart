class EmploymentModel {
  final int industryId;
  final String industry;

  const EmploymentModel({
    required this.industryId,
    required this.industry,
  });

  factory EmploymentModel.fromJson(Map<String, dynamic> json) {
    return EmploymentModel(
      industryId: (json['Industry ID'] as num).toInt(),
      industry: json['Industry'] as String,
    );
  }
}
