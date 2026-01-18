import 'dart:ui';

import 'package:usa_observer_app/theme/app_colors.dart';

abstract class AppTextStyles {
  static final TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static final TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final TextStyle caption = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}