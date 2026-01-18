import 'package:usa_observer_app/features/main_screen/models/category_type.dart';

class Category {
  final CategoryType type;
  final String title;
  final String emoji;
  final String description;

  const Category({
    required this.type,
    required this.title,
    required this.emoji,
    required this.description,
  });
}
