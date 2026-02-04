import 'package:usa_observer_app/features/main_screen/models/category.dart';
import 'package:usa_observer_app/features/main_screen/models/category_type.dart';

class Categories {
  static const all = <Category>[
    Category(
      type: CategoryType.population,
      title: 'Population',
      emoji: '👥',
      description: 'Population size and demographics',
    ),
    Category(
      type: CategoryType.income,
      title: 'Income',
      emoji: '💰',
      description: 'Income indicators',
    ),
    Category(
      type: CategoryType.employment,
      title: 'Employment',
      emoji: '🧑‍💼',
      description: 'Jobs, unemployment and labor market',
    ),
    Category(
      type: CategoryType.industries,
      title: 'Industries',
      emoji: '🏭',
      description: 'Economic sectors and industries',
    ),
    Category(
      type: CategoryType.education,
      title: 'Education',
      emoji: '🎓',
      description: 'Education levels and degrees',
    ),
    Category(
      type: CategoryType.geography,
      title: 'Geography',
      emoji: '🌎',
      description: 'States, cities and regions',
    ),
    Category(
      type: CategoryType.trends,
      title: 'Trends',
      emoji: '📈',
      description: 'Changes over time',
    ),
    Category(
      type: CategoryType.custom,
      title: 'Custom',
      emoji: '🔍',
      description: 'Build your own query',
    ),
  ];
}
